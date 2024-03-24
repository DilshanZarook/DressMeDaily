import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';

class Frame4ItemWidget extends StatefulWidget {
  final Function(String) onSelectionChanged;

  Frame4ItemWidget({Key? key, required this.onSelectionChanged}) : super(key: key);

  @override
  _Frame4ItemWidgetState createState() => _Frame4ItemWidgetState();
}

class _Frame4ItemWidgetState extends State<Frame4ItemWidget> {
  String selectedAllClothes = 'All Clothes';


  final allClothesOptions = [
    'All Clothes',
    'Casual','Party','Work'
  ];


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
      ),
      child: createDropdownButton("All Clothes", selectedAllClothes, allClothesOptions),

    );
  }

  Widget createDropdownButton(String label, String selectedValue, List<String> options) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.v, vertical: 2.v),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.h),
        border: Border.all(color: appTheme.black900, width: 1.h),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              selectedAllClothes = newValue!;
              widget.onSelectionChanged(newValue); // Calling the callback
            });
          },

          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 12.fSize,
                  fontFamily: 'Inter',
                ),
              ),
            );
          }).toList(),
          icon: Icon(Icons.arrow_drop_down, color: appTheme.black900),
          iconSize: 24.h,
          dropdownColor: Colors.white,
          elevation: 16,
          style: TextStyle(color: appTheme.black900, fontSize: 12.fSize),
        ),
      ),
    );
  }
}
