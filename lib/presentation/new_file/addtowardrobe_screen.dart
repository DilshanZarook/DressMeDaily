import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'dart:io';
import 'package:sdgp_test01/presentation/Instructions_page/instructions_page.dart';
import 'package:sdgp_test01/presentation/Gender_selection/gender_selection.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
                      width: 400.0, // Increased width
                      height: 400.0, // Increased height
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
                      width: 300.0, // Width for the default case
                      height: 300.0, // Height for the default case
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
                  Container(
                    padding: EdgeInsets.all(8.0), // Optional padding
                    decoration: BoxDecoration(
                      color: Colors.grey, // Set the color to gray
                      borderRadius: BorderRadius.circular(
                          20), // Set the border radius to 20
                    ),
                    child: IconButton(
                      icon: Icon(Icons.camera_alt),
                      iconSize: 50.0,
                      onPressed: () async {
                        pickImageFromCamera();
                        if (_selectedImage == null) return;
                        //Get a referebce to storage root
                        Reference referenceRoot =
                            FirebaseStorage.instance.ref();
                        Reference referenceDirImages =
                            referenceRoot.child('wardrobe');

                        //create a reference for the image to be stored
                        Reference referenceImageToUpload =
                            referenceDirImages.child(uniqueFileName);

                        //handle errors/ success
                        try {
                          //store the file
                          await referenceImageToUpload
                              .putFile(File(_selectedImage!.path));
                          //success: get the download URL
                          imageUrl =
                              await referenceImageToUpload.getDownloadURL();
                        } catch (error) {
                          //some error occured
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 100.v), // Spacing between the buttons
                  Container(
                    padding: EdgeInsets.all(8.0), // Optional padding
                    decoration: BoxDecoration(
                      color: Colors.grey, // Set the color to gray
                      borderRadius: BorderRadius.circular(
                          20), // Set the border radius to 20
                    ),
                    child: IconButton(
                      icon: Icon(Icons.photo_library),
                      iconSize: 50.0,
                      onPressed: () async {
                        pickImageFromGallery();

                        if (_selectedImage == null) return;
                        //Get a referebce to storage root
                        Reference referenceRoot =
                            FirebaseStorage.instance.ref();
                        Reference referenceDirImages =
                            referenceRoot.child('wardrobe');

                        //create a reference for the image to be stored
                        Reference referenceImageToUpload =
                            referenceDirImages.child(uniqueFileName);

                        //handle errors/ success
                        try {
                          //store the file
                          await referenceImageToUpload
                              .putFile(File(_selectedImage!.path));
                          //success: get the download URL
                          imageUrl =
                              await referenceImageToUpload.getDownloadURL();
                        } catch (error) {
                          //some error occured
                        }
                      },
                    ),
                  ),
                ],
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
                        MaterialPageRoute(
                            builder: (context) =>
                                Instructions_page()), // Replace Instructions_page with your actual widget class
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize
                          .min, // To keep the column size only as big as its children
                      children: <Widget>[
                        SizedBox(
                            height: 260), // Keeping the SizedBox for spacing
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
        icon: Icon(Icons.arrow_back),
        iconSize: 40.0, // Increase the size as needed, here it's set to 30.0
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pushNamed("/landing_page");
        },
      ),
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
