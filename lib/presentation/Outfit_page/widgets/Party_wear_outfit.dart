import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:DressMeDaily/core/app_export.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:DressMeDaily/presentation/Firebase_loader/firebase_loader.dart';

class Party_wear_outfit extends StatefulWidget {
  final Function(String)? onImageSelected; // Callback for image selection
  const Party_wear_outfit({Key? key, this.onImageSelected}) : super(key: key);

  @override
  Party_wear_outfitState createState() => Party_wear_outfitState();
}

class Party_wear_outfitState extends State<Party_wear_outfit> {


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
      if (ref.name.contains('party-wear')) {
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
            // Replace CircularProgressIndicator with SpinningLogo
            return Center(child: SpinningLogo());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<String> imageUrls = snapshot.data as List<String>;
            return Container(
              width: 280.h, // Set width to 200
              height: 170.h, // Set height to 100
              decoration: BoxDecoration(
                color: Color(0xFF9d9d9d),// Brown color
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            downloadedURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          }
        });}}

