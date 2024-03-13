import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/core/Data_model/item_model.dart'; // Replace with the actual path of your ItemModel file
import 'package:flutter_svg/flutter_svg.dart';

class Frame405Bottomsheet extends StatefulWidget {
  const Frame405Bottomsheet({Key? key}) : super(key: key);

  @override
  _Frame405BottomsheetState createState() => _Frame405BottomsheetState();
}

class _Frame405BottomsheetState extends State<Frame405Bottomsheet> {
  List<ItemModel> items = List.generate(20, (_) => ItemModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            // Enlarged GestureDetector for better dragging experience
            Positioned(
              top: 0,  // Starts from the very top of the container
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy > 20) {
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width, // Full width of the container
                  height: 60, // Increased height for easier drag
                  alignment: Alignment.topCenter,
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
            ),
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  alignment: WrapAlignment.center,
                  children: items.map((item) {
                    return Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: item.isPlaceholder
                          ? SvgPicture.asset('assets/images/clothing_add.svg') // Update path as needed
                          : (item.imageUrl != null)
                          ? Image.network(item.imageUrl!, fit: BoxFit.cover)
                          : Center(child: Text('No Image')),
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