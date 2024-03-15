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

  Future<List<String>> _searchImages() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    ListResult result = await storage.ref('wardrobe').listAll();
    List<String> imageUrls = [];

    String searchKey = widget.imageName.toLowerCase();
    for (var ref in result.items) {
      if (ref.name.toLowerCase().contains(searchKey)) {
        String url = await ref.getDownloadURL();
        imageUrls.add(url);
      }
    }

    return imageUrls;
  }

  Future<List<String>> _fetchImagesFromStorage() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    ListResult result = await storage.ref('Online_Shops').listAll();
    List<String> imageUrls = [];

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
          content: Text('Would you like to continue to Online Shops?'),
          actions: [
            TextButton(
              child: Text('Go to the shop!'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.green[400],
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
        : FutureBuilder<List<String>>(
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
          ),
    );
  }
}
