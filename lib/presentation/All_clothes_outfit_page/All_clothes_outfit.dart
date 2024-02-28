import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/core/Data_model/item_model.dart'; // Replace with the actual path of your ItemModel file
import 'package:sdgp_test01/core/app_export.dart';

class CustomContainerSection extends StatefulWidget {
  const CustomContainerSection({Key? key}) : super(key: key);

  @override
  _CustomContainerSectionState createState() => _CustomContainerSectionState();
}

class _CustomContainerSectionState extends State<CustomContainerSection> {
  List<ItemModel> items = List.generate(20, (_) => ItemModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.h, // Set width to 200
      height: 150.h, // Set height to 100
      decoration: BoxDecoration(
        color: Color(0xFF8B7B7B), // Brown color
        borderRadius: BorderRadius.circular(
            20), // Border radius of 20 for the entire container
      ),
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: items.map((item) {
            return Container(
              width: 100,
              // Keep the existing width
              height: 100,
              // Keep the existing height
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20), // Keep existing border radius
              ),
              child: item.isPlaceholder
                  ? SvgPicture.asset(
                      'assets/images/clothing_add.svg') // Update path as needed
                  : (item.imageUrl != null)
                      ? Image.network(item.imageUrl!, fit: BoxFit.cover)
                      : Center(child: Text('No Image')),
            );
          }).toList(),
        ),
      ),
    );
  }
}
