import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';

class AddtowardrobeScreen extends StatefulWidget {
  const AddtowardrobeScreen({Key? key}) : super(key: key);

  @override
  _AddtowardrobeScreenState createState() => _AddtowardrobeScreenState();
}

class _AddtowardrobeScreenState extends State<AddtowardrobeScreen> {
  File? _selectedImage;
  String imageUrl = '';
  String imageLabel = ''; // Variable to hold the label name

  Future<void> pickImageFromCamera() async {
    await _pickImage(ImageSource.camera);
  }

  Future<void> pickImageFromGallery() async {
    await _pickImage(ImageSource.gallery);
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage == null) return;

    File imageFile = File(pickedImage.path);

    setState(() {
      _selectedImage = imageFile;
    });

    await _uploadImage(imageFile);
  }

  Future<void> _uploadImage(File image) async {
    try {
      var uri = Uri.parse('http://127.0.0.1:5000/classify');
      var request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('img', image.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        var jsonResponse = jsonDecode(responseString);

        String message = jsonResponse['message'];
        List<dynamic> predictions = jsonResponse['top_predictions'];
        showClassificationResults(message, predictions);
      } else {
        print('Error: Server responded with status code: ${response.statusCode}');
      }
    } catch (e) {
      showSnackBar('Exception caught during image processing: $e');
    }
  }

  void showClassificationResults(String message, List<dynamic> predictions) {
    if (predictions.isEmpty) {
      setState(() {
        imageLabel = ''; // Reset label if no prediction is available
      });
      showSnackBar("Due to picture defect our AI model cannot identify this image, try another one.");
      return;
    }

    var topPrediction = predictions.first;
    double probability = topPrediction['probability'] * 100;
    TextEditingController customLabelController = TextEditingController();

    void askUserForLabel() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Enter Custom Label"),
            content: TextField(
              controller: customLabelController,
              decoration: const InputDecoration(hintText: "Enter correct label"),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Save"),
                onPressed: () {
                  setState(() {
                    imageLabel = customLabelController.text;
                  });
                  Navigator.of(context).pop();
                  uploadToFirebase(_selectedImage!);
                },
              ),
            ],
          );
        },
      );
    }
    
   void showDialogForClassification(String message, String label, double probability) {
  TextEditingController customLabelController = TextEditingController();
  String? wearType;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(message),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                "Is it a $label?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "Probability: ${probability.toStringAsFixed(2)}%",
                style: TextStyle(fontSize: 16),
              ),
              DropdownButton<String>(
                value: wearType,
                onChanged: (String? newValue) {
                  setState(() {
                    wearType = newValue;
                  });
                },
                items: <String>['work-wear', 'party-wear', 'casual-wear']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: Text("Select Category (optional)"),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text("Confirm"),
            onPressed: () {
              String finalLabel;
              if (wearType != null) {
                finalLabel = "${label}_${wearType}";
              } else {
                finalLabel = label;
              }
              setState(() {
                imageLabel = finalLabel;
              });
              Navigator.of(context).pop();
              uploadToFirebase(_selectedImage!);
            },
          ),
          TextButton(
            child: Text("No, it's not correct"),
            onPressed: () {
              Navigator.of(context).pop();
              askUserForLabel();
            },
          ),
        ],
      );
    },
  );
}


    showDialogForClassification(message, topPrediction['label'], probability);
  }

  Future<void> uploadToFirebase(File image) async {
    String fileName = imageLabel.isNotEmpty ? '${imageLabel}${DateTime.now().millisecondsSinceEpoch}.jpg' : 'unlabeled${DateTime.now().millisecondsSinceEpoch}.jpg';

    Reference storageReference = FirebaseStorage.instance.ref().child('wardrobe/$fileName');
    try {
      await storageReference.putFile(image);
      var downloadUrl = await storageReference.getDownloadURL();
      setState(() {
        imageUrl = downloadUrl;
      });
      showSnackBar("Image uploaded with label: $imageLabel");
    } catch (e) {
      showSnackBar('Exception caught during Firebase upload: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_selectedImage != null)
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300.0,
                child: Image.file(_selectedImage!, fit: BoxFit.cover),
              ),
            if (_selectedImage == null)
              Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Take a snap",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIconButton(Icons.camera_alt, pickImageFromCamera),
                const SizedBox(width: 20.0),
                _buildIconButton(Icons.photo_library, pickImageFromGallery),
              ],
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Add to Wardrobe'),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(icon),
        iconSize: 50.0,
        onPressed: onPressed,
      ),
    );
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}