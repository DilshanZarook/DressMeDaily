import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:url_launcher/url_launcher.dart';

class Frame405Bottomsheet extends StatefulWidget {
  const Frame405Bottomsheet({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Frame405BottomsheetState createState() => _Frame405BottomsheetState();
}

class _Frame405BottomsheetState extends State<Frame405Bottomsheet> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    // Call the function to fetch images from Firebase storage
    getFirestoreImages();
  }

  Future<List<String>> getFirestoreImages() async {
    String folderPath = "favourites";
    QuerySnapshot result = await FirebaseFirestore.instance.collection(folderPath).get();

    for (var doc in result.docs) {
      String downloadedURL = doc['Image url'];
      imageUrls.add(downloadedURL);
    }

    return imageUrls;
  }
   Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getFirestoreImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<String> imageUrls = snapshot.data as List<String>;
            return Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: 700.h,
                margin: const EdgeInsets.only(top: 200),
                decoration: const BoxDecoration(
                  color: Color(0xFF8B7B7B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // Enlarged GestureDetector for better dragging experience
                    Positioned(
                      top: 0, // Starts from the very top of the container
                      child: GestureDetector(
                        onVerticalDragUpdate: (details) {
                          if (details.delta.dy > 20) {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context)
                              .size
                              .width, // Full width of the container
                          height: 60, // Increased height for easier drag
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 150,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(50),
                            ),
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
                          ? [const Center(child: CircularProgressIndicator())]
                          : imageUrls.map((downloadedURL) {
                              return GestureDetector(
                                onTap: () => _launchURL(downloadedURL),
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  margin: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
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
            );
          }
        });
  }
}
