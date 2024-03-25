import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:DressMeDaily/core/app_export.dart';

class Top_wear_Selection extends StatefulWidget {
  const Top_wear_Selection({Key? key}) : super(key: key);

  @override
  _Top_wear_SelectionState createState() => _Top_wear_SelectionState();
}

class ItemModel {
  bool isPlaceholder;
  String? imageUrl;

  ItemModel({this.isPlaceholder = false, this.imageUrl});
}

class _Top_wear_SelectionState extends State<Top_wear_Selection> {
  // Simulate the images being added manually by updating the imageUrl for each item
  List<ItemModel> items = [
    ItemModel(isPlaceholder: false, imageUrl: 'assets/images/1.png'), // Image for first item
    ItemModel(isPlaceholder: false, imageUrl: 'assets/images/2.png'), // Image for second item
    ItemModel(isPlaceholder: false, imageUrl: 'assets/images/3.png'), // Image for third item
    ItemModel(isPlaceholder: false, imageUrl: 'assets/images/4.png'), // Image for fourth item
    ItemModel(isPlaceholder: false, imageUrl: 'assets/images/5.png'), // Image for fifth item
    // Assuming that the rest are placeholders or other images
    ...List.generate(15, (_) => ItemModel(isPlaceholder: true)),
  ];
  int? selectedBoxIndex;
  Widget _buildItemBox(ItemModel item, int index) {
    bool isSelected = selectedBoxIndex == index;

    // Use an AnimatedContainer for smooth resizing when selected
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBoxIndex = isSelected ? null : index;
        });
      },
      child: Transform.scale(
        scale: isSelected ? 1.1 : 1.0, // Enlarge the selected box by 10%
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: isSelected ? 132 : 120,
          height: isSelected ? 132 : 120,
          margin: EdgeInsets.all(isSelected ? 10 : 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: isSelected
                ? Border.all(
                    color: Colors.greenAccent[400]!,
                    width: 3,
                  )
                : null,
          ),
          child: item.imageUrl != null
              ? Image.asset(item.imageUrl!,
              fit: BoxFit.cover) // Local image
              : Center(child: Text('No Image')), // Fallback text
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 700.h,
        margin: EdgeInsets.only(top: 200),
        decoration: BoxDecoration(
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
              padding: EdgeInsets.only(top: 80),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('top_wear')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No top wear found.'));
                  }

                  List<ItemModel> items = snapshot.data!.docs.map((doc) {
                    Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    return ItemModel(
                      isPlaceholder: false,
                      imageUrl: data['imageUrl']
                          as String?, // Make sure 'imageUrl' is the correct field name in your Firestore collection
                    );
                  }).toList();

                  return SingleChildScrollView(
                    child: Wrap(
                      spacing: 40,
                      runSpacing: 40,
                      alignment: WrapAlignment.center,
                      children: List.generate(items.length, (index) {
                        return _buildItemBox(items[index], index);
                      }),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}