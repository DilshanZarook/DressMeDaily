import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class AddtowardrobeScreen extends StatefulWidget {
  const AddtowardrobeScreen({Key? key}) : super(key: key);

  @override
  _AddtowardrobeScreenState createState() => _AddtowardrobeScreenState();
}

class _AddtowardrobeScreenState extends State<AddtowardrobeScreen> {
  File? _selectedImage;
  String imageUrl = '';
  bool isLoading = false; // New state variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 35.0),
          child: Column(
            children: [
              const SizedBox(height: 60.0),
              _selectedImage != null
                  ? isLoading 
                      ? Center(child: CircularProgressIndicator()) // Display a loading indicator
                      : Image.network(
                          imageUrl,
                          width: 400.0,
                          height: 400.0,
                          fit: BoxFit.cover,
                        )
                  : Container(
                      width: 300.0,
                      height: 300.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Take a snap",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
              const SizedBox(height: 150.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIconButton(Icons.camera_alt, pickImageFromCamera),
                  const SizedBox(width: 100.0),
                  _buildIconButton(Icons.photo_library, pickImageFromGallery),
                ],
              ),
              const SizedBox(height: 90.0),
              // Additional widgets can be added here
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Function onPressed) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(icon),
        iconSize: 50.0,
        onPressed: () => onPressed(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        iconSize: 40.0,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      // Rest of your AppBar properties...
    );
  }

  Future<void> pickImageFromGallery() async {
    await _pickImage(ImageSource.gallery);
  }

  Future<void> pickImageFromCamera() async {
    await _pickImage(ImageSource.camera);
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage == null) return;

    File imageFile = File(pickedImage.path);

    setState(() {
      _selectedImage = imageFile;
      isLoading = true; // Set loading to true
    });

    await _uploadImage(imageFile);
  }

  Future<void> _uploadImage(File image) async {
    String uniqueFileName = '${DateTime.now().millisecondsSinceEpoch}.jpg'; // Ensure file extension

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('wardrobe');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageToUpload.putFile(image, SettableMetadata(contentType: 'image/jpeg'));
      String downloadUrl = await referenceImageToUpload.getDownloadURL();
      setState(() {
        imageUrl = downloadUrl;
        isLoading = false; // Set loading to false
      });
      print("Image URL: $downloadUrl");
    } catch (error) {
      print("Upload error: $error");
    }
  }
}
