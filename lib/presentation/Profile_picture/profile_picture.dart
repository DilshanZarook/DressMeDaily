import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'dart:io';
import 'package:sdgp_test01/presentation/Instructions_page/instructions_page.dart';
import 'package:sdgp_test01/presentation/Gender_selection/gender_selection.dart';

class Profile_picture extends StatefulWidget {
  const Profile_picture({Key? key}) : super(key: key);

  @override
  _Profile_pictureState createState() => _Profile_pictureState();
}

class _Profile_pictureState extends State<Profile_picture> {
  File? _selectedImage;

  // send user's profile picture to database
  Future<void> uploadImageToFirebase(File imageFile) async {
  try {
    // Create a unique filename for the image
    String fileName = 'profilePic_${DateTime.now().millisecondsSinceEpoch}.jpg';

    // Get the reference to the Firebase Storage location
    firebase_storage.Reference firebaseStorageRef =
        firebase_storage.FirebaseStorage.instance.ref().child('Profile_Images/$fileName');

    // Upload the file to Firebase Storage
    await firebaseStorageRef.putFile(imageFile);

    // Get the download URL for the uploaded image
    String downloadURL = await firebaseStorageRef.getDownloadURL();

    // Now you can save this download URL to Firestore or wherever you need it
    print('Image uploaded to Firebase Storage: $downloadURL');
  } catch (e) {
    print('Error uploading image to Firebase Storage: $e');
  }
}


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
              Container(
                  height: 6.v,
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: appTheme.black900),
                  child: LinearProgressIndicator(
                      value: 0.70,
                      backgroundColor: appTheme.black900,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(appTheme.lime400))),
              const SizedBox(height: 60.0),
              _selectedImage != null
                  ? CircleAvatar(
                      radius: 115.0, // Adjust the size as needed
                      backgroundImage: FileImage(_selectedImage!),
                    )
                  : const CircleAvatar(
                      radius: 115.0, // Adjust the size as needed
                      backgroundColor: Colors.grey, // Default color
                      child: Text(
                        "Add a profile picture",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
              const SizedBox(height: 50.0),
              Container(
                width: 160,
                padding: const EdgeInsets.all(8.0), // Optional padding
                decoration: BoxDecoration(
                  color: Colors.grey, // Set the color to gray
                  borderRadius:
                      BorderRadius.circular(20), // Set the border radius to 20
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.camera_alt),
                      iconSize: 50.0,
                      onPressed: () {
                        pickImageFromCamera();
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.photo_library),
                      iconSize: 50.0,
                      onPressed: () {
                        pickImageFromGallery();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 90.0),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: GestureDetector(
                    onTap: () {
                      // Modified navigation logic
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Instructions_page()), // Replace Instructions_page with your actual widget class
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize
                          .min, // To keep the column size only as big as its children
                      children: <Widget>[
                        const SizedBox(
                            height: 190), // Keeping the SizedBox for spacing
                        Container(
                          margin: const EdgeInsets.only(
                              right: 20.0), // Adjust the margin value as needed
                          child: const Text(
                            "Next",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
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
        icon: const Icon(Icons.arrow_back),
        iconSize: 40.0, // Increase the size as needed, here it's set to 30.0
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Navigate to GenderSelectionScreen
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const Gender_selection()), // Replace with the actual name of your GenderSelectionScreen widget
            );
          },
          child: const Text(
            "Skip",
            style: TextStyle(
              color: Colors.black, // Text color set to black
              fontSize: 18.0, // Font size set to 18
              fontWeight: FontWeight
                  .normal, // Optional: Adjust the font weight as needed
            ),
          ),
        ),
      ],
      // Rest of your AppBar properties
    );
  }

  Future<void> pickImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage == null) return;

    setState(() {
      _selectedImage = File(pickedImage.path);
    });

    // Upload the selected image to Firebase Storage
    uploadImageToFirebase(_selectedImage!);
  }

  Future<void> pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;

    setState(() {
      _selectedImage = File(pickedImage.path);
    });

    // Upload the selected image to Firebase Storage
    uploadImageToFirebase(_selectedImage!);
  }
}
