// page1.dart
import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:sdgp_test01/core/Data_model/item_model.dart'; 
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/AnimatedHeader.dart';

// ignore: camel_case_types
class Casual_wear_page extends StatefulWidget {
  const Casual_wear_page({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Casual_wear_pageState createState() => _Casual_wear_pageState();
}

// ignore: camel_case_types
class _Casual_wear_pageState extends State<Casual_wear_page> {
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

            return Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(alignment: Alignment.topCenter, children: [
                  AnimatedHeader(
                    title: 'Casual Wear',
                    backgroundColor: Colors.red,
                    startOffset: -MediaQuery.of(context).size.height *
                        0.2, // adjust based on your needs
                    endOffset:
                        0.0, // typically, this would be below the status bar
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 700.h,
                    margin: const EdgeInsets.only(top: 250),
                    decoration: const BoxDecoration(
                      color: Color(0xFFf34034),
                      // Keep the main container with brown color
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          top: 30,
                          child: GestureDetector(
                            onVerticalDragEnd: (details) {
                              // Check the drag velocity or distance to decide if the gesture should trigger navigation
                              if (details.primaryVelocity! > 1000) {
                                // Adjust this threshold as needed
                                Navigator.of(context).pop();
                              }
                            },
                            child: Container(
                              width: 150,
                              height: 20,
                              decoration: BoxDecoration(
                                color: const Color(0xFF591712),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
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
                                      onTap: () => _launchURL(downloadedURL),
                                      child: Container(
                                        width: 120,
                                        height: 120,
                                        margin: const EdgeInsets.all(20),
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
                        ),
                      ],
                    ),
                  ),
                ]));
          }
        });
  }
}
