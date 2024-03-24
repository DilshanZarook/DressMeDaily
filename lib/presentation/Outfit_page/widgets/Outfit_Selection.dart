import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';

class Outfit_Selection extends StatefulWidget {
  final Function(String)? onImageSelected; // Callback for image selection
  const Outfit_Selection({Key? key, this.onImageSelected}) : super(key: key);

  @override
  _Outfit_SelectionState createState() => _Outfit_SelectionState();
}

class _Outfit_SelectionState extends State<Outfit_Selection> {

  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    // Call the function to fetch images from Firebase storage
    getFirebaseImages();
  }

  Future<List<String>> getFirebaseImages() async {
    String folderPath = "wardrobe";
    firebase_storage.ListResult result = await firebase_storage
        .FirebaseStorage.instance
        .ref(folderPath)
        .listAll();

    for (var i in result.items) {
      String downloadedURL = await i.getDownloadURL();
      imageUrls.add(downloadedURL);
    }

    return imageUrls;
  }

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> addToFavos(String url) async {
    await FirebaseFirestore.instance.collection('favourites').add({
      'Image url': url,
      'timestamp': FieldValue.serverTimestamp(),
    });
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to favourites'),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getFirebaseImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<String> imageUrls = snapshot.data as List<String>;
            return Container(
              width: 400.h, // Set width to 200
              height: 300.h, // Set height to 100
              decoration: BoxDecoration(
                color: Color(0xFF9d9d9d), // Brown color
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
                      onDoubleTap: () => addToFavos(downloadedURL),
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
