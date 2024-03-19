import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Casual_wear_outfit extends StatefulWidget {
  final Function(String)? onImageSelected; // Callback for image selection
  const Casual_wear_outfit({Key? key, this.onImageSelected}) : super(key: key);

  @override
  Casual_wear_outfitState createState() => Casual_wear_outfitState();
}

class Casual_wear_outfitState extends State<Casual_wear_outfit> {

  @override
  void initState() {
    super.initState();
    // Call the function to fetch images from Firebase storage
    fetchCasualWearImages();
  }

  Future<List<String>> fetchCasualWearImages() async {
    firebase_storage.Reference ref =
    firebase_storage.FirebaseStorage.instance.ref().child('wardrobe');

    ListResult result = await ref.listAll();
    List<String> imageUrls = [];

    for (var ref in result.items) {
      // Iterate over each item directly
      if (ref.name.contains('casual-wear')) {
        String downloadedURL = await ref.getDownloadURL();
        imageUrls.add(downloadedURL);
      }
    }

    return imageUrls; // Return the list of image URLs after adding them all
  }

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchCasualWearImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<String> imageUrls = snapshot.data as List<String>;
            return Container(
              width: 280.h, // Set width to 200
              height: 170.h, // Set height to 100
              decoration: BoxDecoration(
                color: Color(0xFF8B7B7B), // Brown color
                borderRadius: BorderRadius.circular(
                    20), // Border radius of 20 for the entire container
              ),
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  alignment: WrapAlignment.center,
                  children: imageUrls.isEmpty
                      ? [
                    const Center(
                        child: CircularProgressIndicator())
                  ]
                      : imageUrls.map((downloadedURL) {
                    return GestureDetector(
                      onTap: () {
                        if (widget.onImageSelected != null) {
                          widget.onImageSelected!(downloadedURL); // Use the callback
                        } else {
                          _launchURL(downloadedURL);
                        }
                      },
                      child: Container(
                        width: 140,
                        height: 140,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                        child: Image.network(
                          downloadedURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          }
        });}}
