import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:sdgp_test01/presentation/Instructions_page/instructions_page.dart';

class Profile_picture extends StatefulWidget {
  const Profile_picture({Key? key}) : super(key: key);

  @override
  _Profile_pictureState createState() => _Profile_pictureState();
}

class _Profile_pictureState extends State<Profile_picture> {
  File? _selectedImage;

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
                LinearProgressIndicator(
                  value: 0.80,
                  backgroundColor: Colors.black,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.lime),
                ),
                SizedBox(height: 60.0),
                _selectedImage != null
                    ? CircleAvatar(
                  radius: 115.0, // Adjust the size as needed
                  backgroundImage: FileImage(_selectedImage!),
                )
                    : CircleAvatar(
                  radius: 115.0, // Adjust the size as needed
                  backgroundColor: Colors.grey, // Default color
                  child: Text(
                    "Add a profile picture",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.white),

                  ),
                ),
                SizedBox(height: 50.0),
                Container(
                  width: 160,
                  padding: EdgeInsets.all(8.0), // Optional padding
                  decoration: BoxDecoration(
                    color: Colors.grey, // Set the color to gray
                    borderRadius: BorderRadius.circular(20), // Set the border radius to 20
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.camera_alt),
                        iconSize: 50.0,
                        onPressed: () {
                          pickImageFromCamera();
                        },
                      ),

                      IconButton(
                        icon: Icon(Icons.photo_library),
                        iconSize: 50.0,
                        onPressed: () {
                          pickImageFromGallery();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 90.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 50.0),
                    child: GestureDetector(
                      onTap: () {
                        // Modified navigation logic
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Instructions_page()), // Replace Frame2 with your actual widget class
                        );
                      },
                      child: Text(
                        "Next",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        iconSize: 40.0, // Increase the size as needed, here it's set to 30.0
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Skip logic here
          },
          child: Text(
            "Skip",
            style: TextStyle(
              // Add text style if needed
            ),
          ),
        ),
      ],
      // Rest of your AppBar properties
    );
  }

  Future<void> pickImageFromGallery() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }

  Future<void> pickImageFromCamera() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage == null) return;

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }
}
