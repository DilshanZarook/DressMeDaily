import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search_output extends StatefulWidget {
  final String imageName;

  Search_output({Key? key, required this.imageName}) : super(key: key);

  @override
  _Search_outputState createState() => _Search_outputState();
}

class _Search_outputState extends State<Search_output> {
  Future<List<Map<String, dynamic>>> _searchImages() async {
    var collection = FirebaseFirestore.instance.collection('wardrobe');
    String searchKey = widget.imageName;
    String nextString = searchKey.substring(0, searchKey.length - 1) + String.fromCharCode(searchKey.codeUnitAt(searchKey.length - 1) + 1);

    var querySnapshot = await collection
      .where('imageName', isGreaterThanOrEqualTo: searchKey)
      .where('imageName', isLessThan: nextString)
      .get();

    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Results')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _searchImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No results found'));
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
