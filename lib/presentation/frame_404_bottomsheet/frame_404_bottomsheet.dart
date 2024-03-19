import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:DressMeDaily/presentation/Global/global.dart' as globals;

class Frame404Bottomsheet extends StatefulWidget {
  const Frame404Bottomsheet({Key? key}) : super(key: key);

  @override
  _Frame404BottomsheetState createState() => _Frame404BottomsheetState();
}

class _Frame404BottomsheetState extends State<Frame404Bottomsheet> {
  List<ItemModel> items = [];
  bool isLoading = true;
  int? selectedIndex; // Variable to keep track of the selected index

  @override
  void initState() {
    super.initState();
    _fetchOutfits();
  }

  Future<void> _fetchOutfits() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('outfits').get();
      var newItems = querySnapshot.docs.map((doc) => ItemModel.fromFirestore(doc)).toList();
      setState(() {
        items = newItems;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching outfits: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void showImagesDialog(ItemModel item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (item.topWearImageUrl != null)
                  Image.network(item.topWearImageUrl!, fit: BoxFit.cover, width: 200, height: 200),
                SizedBox(height: 10),
                if (item.bottomWearImageUrl != null)
                  Image.network(item.bottomWearImageUrl!, fit: BoxFit.cover, width: 200, height: 200),
                SizedBox(height: 10),
                Text(item.outfitName ?? 'No Outfit Name'),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onItemTap(ItemModel item, int index) {
    setState(() {
      selectedIndex = index; // Update selected index
      globals.setSelectedItem(item); // Use globals.setSelectedItem to update globally
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 900,
        margin: const EdgeInsets.only(top: 200),
        decoration: const BoxDecoration(
          color: Color(0xFF9d9d9d),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80),
            topRight: Radius.circular(80),
          ),
        ),

        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 30),
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.spaceEvenly,
                  children: items.asMap().entries.map((entry) {
                    int idx = entry.key;
                    ItemModel item = entry.value;
                    return GestureDetector(
                      onDoubleTap: () => showImagesDialog(item),
                      onTap: () => _onItemTap(item, idx),
                      child: Container(
                        width: 160,
                        height: 160,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: selectedIndex == idx
                              ? Border.all(color: Colors.green, width: 3)
                              : null,
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
            Positioned(
              top: 30,
              left: MediaQuery.of(context).size.width / 2 - 75, // Center the draggable container
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy > 5) {
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  width: 150,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(0xFF575757),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
