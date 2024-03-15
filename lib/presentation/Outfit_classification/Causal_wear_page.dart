// page1.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/core/Data_model/item_model.dart'; // Replace with the actual path of your ItemModel file
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/AnimatedHeader.dart';

class Casual_wear_page extends StatefulWidget {
  const Casual_wear_page({Key? key}) : super(key: key);

  @override
  _Casual_wear_pageState createState() => _Casual_wear_pageState();
}

class _Casual_wear_pageState extends State<Casual_wear_page> {
  List<ItemModel> items = List.generate(20, (_) => ItemModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(alignment: Alignment.topCenter, children: [
          AnimatedHeader(
            title: 'Casual Wear',
            backgroundColor: Colors.red,
            startOffset: -MediaQuery.of(context).size.height *
                0.2, // adjust based on your needs
            endOffset: 0.0, // typically, this would be below the status bar
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 700.h,
            margin: EdgeInsets.only(top: 250),
            decoration: BoxDecoration(
              color: Color(0xFFf34034),
              // Keep the main container with brown color
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
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
                        color: Color(0xFF591712),
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
                        return Container(
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
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
