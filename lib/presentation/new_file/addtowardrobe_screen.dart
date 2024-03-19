//19th march 11.18 code adjusted.
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:ui' as ui; 

class AddtowardrobeScreen extends StatefulWidget {
  const AddtowardrobeScreen({Key? key}) : super(key: key);

  @override
  _AddtowardrobeScreenState createState() => _AddtowardrobeScreenState();
}

class _AddtowardrobeScreenState extends State<AddtowardrobeScreen> {
  String? wearType; // Defining wearType at the class level
  File? _selectedImage; // Add a new variable to hold the selected image
  String imageUrl = ''; // Add a new variable to hold the image URL
  String imageLabel = ''; // Variable to hold the label name
  bool _isLoading = false; // Add a new variable to track loading state

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
    setState(() {
    _isLoading = true; // Show spinner
 });
    try {
    var uri = Uri.parse('https://dressmedaily-umlonkv2sa-as.a.run.app/classify');
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
      String errorMessage = 'An error occurred.';
      if (response.statusCode == 500) {
        // Check for specific error message (same approach as before)
      }
      showSnackBar(errorMessage);
    }
 } catch (e) {
    showSnackBar('An unexpected error occurred. Please try again later.');
 } finally {
    setState(() {
      _isLoading = false; // Hide spinner
    });
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
    double probability = topPrediction['probability'];
    // TextEditingController customLabelController = TextEditingController();

  void askUserForLabel() {
    TextEditingController customLabelController = TextEditingController();
    String dropdownValue = 'work-wear'; // Default value

  showDialog(
 context: context,
 builder: (BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF575757),
      title: Text("Enter Custom Label", style: TextStyle(color: Color(0xFF98FF60))),
      content: SizedBox(
        width: 300,
        height: 168,
        child: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                controller: customLabelController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  // border: InputBorder.none,
                 hintText: "Enter correct label", 
                 hintStyle: TextStyle(color: Color.fromARGB(64, 255, 255, 255)),
                ),
              ),
              Text("Select the Category before confirm it. ", style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255))),
              Text(""),
              Theme(
                data: Theme.of(context).copyWith(
                 focusColor: Colors.transparent, // Remove focus highlight
                 hoverColor: Colors.transparent, // Remove hover highlight
                ),
                child: DropdownButtonFormField<String>(
                 value: dropdownValue,
                 decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Color(0xFF474747),
                    filled: true,
                 ),
                 style: TextStyle(color: Colors.white),
                 dropdownColor: Color(0xFF474747), // Set dropdown menu color
                 items: <String>['work-wear', 'party-wear', 'casual-wear']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.white)),
                    );
                 }).toList(),
                 onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                 },
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text("Save", style: TextStyle(color: Color(0xFF98FF60))),
          onPressed: () {
            // if (dropdownValue == null || customLabelController.text.isEmpty) {
              // Prompt user to select a category and enter a label
              showDialog(
                context: context,
                builder: (BuildContext context) {
                 return AlertDialog(
                    backgroundColor: Color(0xFF575757),
                    title: Text('Missing Information', style: TextStyle(color: Color(0xFF98FF60))),
                    content: Text('Please select a category and enter a label.', style: TextStyle(color: Color(0xFF98FF60))),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK', style: TextStyle(color: Color(0xFF98FF60))),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the prompt dialog
                        },
                      ),
                    ],
                 );
                },
              );
            // } else {
            //   String finalLabel = "${customLabelController.text}_$dropdownValue";
            //   setState(() { imageLabel = finalLabel; });
            //   Navigator.of(context).pop(); // Close the original dialog
            //   uploadToFirebase(_selectedImage!);
            // }
          },
        ),
      ],
    );
 },
);

}

    
void showDialogForClassification(String message, String label, double probability) {
//  TextEditingController customLabelController = TextEditingController();
 String dropdownValue = 'work-wear'; // Default value
 

 showDialog(
 context: context,
 builder: (BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF575757),
      title: Text(message, style: TextStyle(color: Colors.white)),
      content: SizedBox(
        width: 300,
        height: 168,
        child: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                "Is it a $label?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF98FF60)),
              ),
              Text(
                "Probability: ${probability.toStringAsFixed(2)}%",
                style: TextStyle(fontSize: 16, color: Color(0xFF98FF60)),
              ),
              Text("Select the Category before confirm it. ", style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255))),
              Text(""),
              Theme(
                data: Theme.of(context).copyWith(
                 focusColor: Colors.transparent, // Remove focus highlight
                 hoverColor: Colors.transparent, // Remove hover highlight
                ),
                child: DropdownButtonFormField<String>(
                 value: dropdownValue,
                 decoration: InputDecoration(
                    border: OutlineInputBorder(),

                    fillColor: Color(0xFF474747),
                    filled: true,
                 ),
                 style: TextStyle(color: Colors.white),
                 dropdownColor: Color(0xFF474747), // Set dropdown menu color
            
                 items: <String>['work-wear', 'party-wear', 'casual-wear']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.white)),
                    );
                 }).toList(),
                 onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                 },
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text("Confirm", style: TextStyle(color: Color(0xFF98FF60))),
          onPressed: () {
            // String finalLabel;
            // if (dropdownValue != null) {
            //   finalLabel = "${label}_${dropdownValue}";
            // } else {
            //   finalLabel = label;
            // }
            // setState(() {
            //   imageLabel = finalLabel;
            // });
            Navigator.of(context).pop();
            uploadToFirebase(_selectedImage!);
          },
        ),
        TextButton(
          child: Text("No, it's not correct", style: TextStyle(color: Color(0xFF98FF60))),
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
    String fileName = imageLabel.isNotEmpty ? '${imageLabel}_${DateTime.now().millisecondsSinceEpoch}.jpg' : 'unlabeled_${DateTime.now().millisecondsSinceEpoch}.jpg';

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
 return Stack(
    children: [
      Scaffold(
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
                 child: Image.file(_selectedImage!,),
                ),
              if (_selectedImage == null)
                Container(
                 width: 300.0,
                 height: 300.0,
                 decoration: BoxDecoration(
                    color: Color(0xFF9E9E9E),
                    borderRadius: BorderRadius.circular(20.0),
                 ),
                 alignment: Alignment.center,
                 child: const Text(
                    "Upload your image here!",
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
      ),
      if (_isLoading)
        Positioned.fill(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent black background
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF98FF60)),
              ),
            ),
          ),
        ),
    ],
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


