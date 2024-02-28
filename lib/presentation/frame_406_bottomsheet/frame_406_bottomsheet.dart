import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/core/Data_model/item_model.dart'; // Replace with the actual path of your ItemModel file
import 'package:sdgp_test01/core/app_export.dart';

class Frame406Bottomsheet extends StatefulWidget {
  const Frame406Bottomsheet({Key? key}) : super(key: key);

  @override
  _Frame406BottomsheetState createState() => _Frame406BottomsheetState();
}

class _Frame406BottomsheetState extends State<Frame406Bottomsheet> {
  List<ItemModel> items = List.generate(20, (_) => ItemModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // Set the background color of the scaffold to transparent
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 700.h,
        margin: EdgeInsets.only(top: 200),
        decoration: BoxDecoration(
          color: Color(0xFF8B7B7B), // Keep the main container with brown color
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
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  alignment: WrapAlignment.center,
                  children: items.map((item) {
                    return GestureDetector(
                        onTap: () {
                          if (item.imageUrl != null) {
                            _showImagePopup(context, item.imageUrl!);
                          }
                        },
                        child: Container(
                          width: 120,
                          height: 120,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: item.isPlaceholder
                              ? SvgPicture.asset(
                                  'assets/images/clothing_add.svg') // Update path as needed
                              : (item.imageUrl != null)
                                  ? Image.network(item.imageUrl!,
                                      fit: BoxFit.cover)
                                  : Center(child: Text('No Image')),
                        ));
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showImagePopup(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Image.network(imageUrl, fit: BoxFit.cover),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                child: Text("Close"),
              ),
            )
          ],
        );
      },
    );
  }
}
