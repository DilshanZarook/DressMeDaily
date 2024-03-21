import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/core/Data_model/item_model.dart'; // Replace with the actual path of your ItemModel file
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Frame404Bottomsheet extends StatefulWidget {
  const Frame404Bottomsheet({Key? key}) : super(key: key);

  @override
  _Frame404BottomsheetState createState() => _Frame404BottomsheetState();
}

class _Frame404BottomsheetState extends State<Frame404Bottomsheet> {
  List<ItemModel> items = [];

  @override
  void initState() {
    super.initState();
    _fetchOutfits();
  }

  Future<void> _fetchOutfits() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('outfits').get();
      var newItems = querySnapshot.docs
          .map((doc) => ItemModel.fromFirestore(doc))
          .toList();
      setState(() {
        items = newItems;
      });
    } catch (e) {
      print("Error fetching outfits: $e");
    }
  }

  void showImagesDialog(ItemModel item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            // To handle overflow if images are large
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Container for the top wear image
                if (item.topWearImageUrl != null)
                  Container(
                    width: 200, // Set your desired width
                    height: 200, // Set your desired height
                    child:
                        Image.network(item.topWearImageUrl!, fit: BoxFit.cover),
                  ),
                SizedBox(height: 10), // Spacing between the two images
                // Container for the bottom wear image
                if (item.bottomWearImageUrl != null)
                  Container(
                    width: 200, // Set your desired width
                    height: 200, // Set your desired height
                    child: Image.network(item.bottomWearImageUrl!,
                        fit: BoxFit.cover),
                  ),
                SizedBox(height: 10),
                Text(item.outfitName ?? 'No Outfit Name'),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: 900, // Replace '700.h' with a MediaQuery or fixed value if needed
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
          Positioned(
            top: 30,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 20) {
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
                children: items.map((item) {
                  return GestureDetector(
                    onTap: () => showImagesDialog(item),
                    child: Container(
                      width: 120,
                      height: 120,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(item.outfitName ?? 'No Outfit Name'),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class ItemModel {
  String? topWearImageUrl;
  String? bottomWearImageUrl;
  String? outfitName;

  ItemModel({this.topWearImageUrl, this.bottomWearImageUrl, this.outfitName});

  factory ItemModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ItemModel(
      topWearImageUrl: data['topWearImageUrl'],
      bottomWearImageUrl: data['bottomWearImageUrl'],
      outfitName: data['outfitName'],
    );
  }
}
