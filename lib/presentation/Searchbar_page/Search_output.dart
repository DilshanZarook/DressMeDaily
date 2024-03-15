import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Search_output extends StatefulWidget {
  final String imageName;

  Search_output({Key? key, required this.imageName}) : super(key: key);

  @override
  _Search_outputState createState() => _Search_outputState();
}

class _Search_outputState extends State<Search_output> {
  bool _showOnlineShops = false;

  Future<List<Map<String, dynamic>>> _searchImages() async {
    var collection = FirebaseFirestore.instance.collection('wardrobe');
    String searchKey = widget.imageName;
    String nextString = searchKey.substring(0, searchKey.length - 1) +
        String.fromCharCode(searchKey.codeUnitAt(searchKey.length - 1) + 1);

    var querySnapshot = await collection
        .where('imageName', isGreaterThanOrEqualTo: searchKey)
        .where('imageName', isLessThan: nextString)
        .get();

    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  Future<List<String>> _fetchImagesFromStorage() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    ListResult result = await storage.ref('Online_Shops').listAll();
    List<String> imageUrls = [];

    // Search keyword from the widget
    String searchKey = widget.imageName.toLowerCase();

    for (var ref in result.items) {
      if (ref.name.toLowerCase().contains(searchKey)) {
        String url = await ref.getDownloadURL();
        imageUrls.add(url);
      }
    }

    return imageUrls;
  }

  void _showNotFoundDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Outfit Not Found!'),
          content: Text('Would you like to continue to Online the Shops?'),
          actions: [
            TextButton(
              child: Text('Go to the shop!'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.grey,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _showOnlineShops = true;
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Results')),
      body: _showOnlineShops
        ? FutureBuilder<List<String>>(
            future: _fetchImagesFromStorage(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No results found'));
              } else {
                var imageUrls = snapshot.data!;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: imageUrls.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(imageUrls[index], fit: BoxFit.cover);
                  },
                );
              }
            },
          )
        : FutureBuilder<List<Map<String, dynamic>>>(
            future: _searchImages(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _showNotFoundDialog();
                });
                return SizedBox.shrink();
              } else {
                var searchResults = snapshot.data!;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(searchResults[index]['imageUrl'], fit: BoxFit.cover);
                  },
                );
              }
            },
          ),
    );
  }
}
