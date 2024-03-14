import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search_output extends StatefulWidget {
  final String imageName;

  Search_output({Key? key, required this.imageName}) : super(key: key);

  @override
  _Search_outputState createState() => _Search_outputState();
}

class _Search_outputState extends State<Search_output> {
  late List<Map<String, dynamic>> searchResults;

  @override
  void initState() {
    super.initState();
    searchResults = [];
    _searchImages();
  }

  Future<void> _searchImages() async {
    var collection = FirebaseFirestore.instance.collection('wardrobe');
    String searchKey = widget.imageName;
    String nextString = searchKey.substring(0, searchKey.length - 1) + 
                        String.fromCharCode(searchKey.codeUnitAt(searchKey.length - 1) + 1);

    var querySnapshot = await collection
      .where('imageName', isGreaterThanOrEqualTo: searchKey)
      .where('imageName', isLessThan: nextString)
      .get();

    if (querySnapshot.docs.isEmpty) {
      print('No results found for image name: ${widget.imageName}');
    } else {
      print('Found ${querySnapshot.docs.length} results');
    }

    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      if (data['imageUrl'] != null && data['imageUrl'].isNotEmpty) {
        searchResults.add(data);
      } else {
        print('Invalid or missing imageUrl in one of the documents');
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: searchResults.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(searchResults[index]['imageUrl'], fit: BoxFit.cover);
        },
      ),
    );
  }
}