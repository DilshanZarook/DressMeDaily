import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/core/Data_model/item_model.dart';

class Frame406Bottomsheet extends StatefulWidget {
  const Frame406Bottomsheet({Key? key}) : super(key: key);


  @override
  // ignore: library_private_types_in_public_api
  _Frame406BottomsheetState createState() => _Frame406BottomsheetState();
}

class _Frame406BottomsheetState extends State<Frame406Bottomsheet> {
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

            return Scaffold(
                backgroundColor: Colors
                    .transparent, // Set the background color of the scaffold to transparent
                body: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 700.h,
                    margin: const EdgeInsets.only(top: 200),
                    decoration: const BoxDecoration(
                      color: Color(
                          0xFF8B7B7B), // Keep the main container with brown color
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        topRight: Radius.circular(80),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
                    child: Stack(alignment: Alignment.topCenter, children: [
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
                              color: Colors.brown,
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
                                onDoubleTap: () => addToFavos(downloadedURL),
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
                    ])));
          }
        });
  }
}

class ItemListModel extends ChangeNotifier {
  List<ItemModel>? _items;

  List<ItemModel>? get items => _items;

  void setItems(List<ItemModel> items) {
    _items = items;
    notifyListeners();
  }
}
