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
  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 35.0),
          child: Column(
            children: [
              SizedBox(height: 60.0),
              _selectedImage != null
                  ? Container(
                      width: 400.0,
                      height: 400.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(_selectedImage!),
                        ),
                      ),
                    )
                  : Container(
                      width: 300.0,
                      height: 300.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Take a snap",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
              SizedBox(height: 150.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIconButton(Icons.camera_alt, pickImageFromCamera),
                  SizedBox(width: 100.0),
                  _buildIconButton(Icons.photo_library, pickImageFromGallery),
                ],
              ),
              SizedBox(height: 90.0),
              // Your other widgets...
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Function onPressed) {
    return Container(
      padding: EdgeInsets.all(8.0),
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
        icon: Icon(Icons.arrow_back),
        iconSize: 40.0,
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pushNamed("/landing_page");
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

    setState(() {
      _selectedImage = File(pickedImage.path);
    });

    await _uploadImage();
  }

  Future<void> _uploadImage() async {
    if (_selectedImage == null) return;

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('wardrobe');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageToUpload.putFile(_selectedImage!);
      imageUrl = await referenceImageToUpload.getDownloadURL();
      print("Image URL: $imageUrl");
    } catch (error) {
      print("Upload error: $error");
    }
  }
}
