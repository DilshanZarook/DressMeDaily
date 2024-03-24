import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sdgp_test01/core/Data_model/item_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class wardrobeOutfits extends StatefulWidget {
  const wardrobeOutfits({Key? key}) : super(key: key);

  @override
  wardrobeOutfitsState createState() => wardrobeOutfitsState();
}

class wardrobeOutfitsState extends State<wardrobeOutfits> {
  List<ItemModel> items = []; // Initialize an empty list for items
  bool isLoading = true; // Initialize isLoading to true

  @override
  void initState() {
    super.initState();
    _fetchOutfits(); // Call method to fetch outfits from Firestore when the widget initializes
  }

  Future<void> _fetchOutfits() async {
    try {
      // Fetch outfits collection from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('outfits').get();

      // Loop through documents and populate items list with retrieved data
      querySnapshot.docs.forEach((doc) {
        String topWearImageUrl = doc['topWearImageUrl'];
        String bottomWearImageUrl = doc['bottomWearImageUrl'];

        // Add retrieved data to the items list
        items.add(ItemModel(
          imageUrl: topWearImageUrl,
          // Add other properties as needed
        ));
        items.add(ItemModel(
          imageUrl: bottomWearImageUrl,
          // Add other properties as needed
        ));
      });

      setState(() {
        isLoading = false; // Set isLoading to false once data is fetched
      });
    } catch (e) {
      print("Error fetching outfits: $e");
      setState(() {
        isLoading = false; // Set isLoading to false if there is an error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 700, // Adjust height as needed
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
              child: isLoading
                  ? const Center(child: CircularProgressIndicator()) // Show loading spinner while fetching data
                  : SingleChildScrollView(
                child: Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  alignment: WrapAlignment.center,
                  children: items.map((item) {
                    return Container(
                      width: 120,
                      height: 120,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: item.imageUrl != null
                          ? Image.network(item.imageUrl!, fit: BoxFit.cover)
                          : SvgPicture.asset('assets/images/clothing_add.svg'), // Use placeholder widget here
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
}
