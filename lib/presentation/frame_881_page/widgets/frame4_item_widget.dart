import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';

class Frame4ItemWidget extends StatefulWidget {
  @override
  _Frame4ItemWidgetState createState() => _Frame4ItemWidgetState();
}

class _Frame4ItemWidgetState extends State<Frame4ItemWidget> {
  String selectedAllClothes = 'All Clothes';

  // String selectedSeason = 'Season';
  String selectedOccasion = 'Occasion';

  // String selectedCategory = 'Category';

  final allClothesOptions = [
    'All Clothes',
    'Jeans',
    'Shirt',
    'Tops',
    'Bottoms',
    'Outerwear',
    'Accessories'
  ];

  // final seasonOptions = ['Season', 'Spring', 'Summer', 'Fall', 'Winter'];
  final occasionOptions = ['Occasion', 'Casual', 'Formal', 'Party'];

  // final categoryOptions = ['Category', 'Tops', 'Bottoms', 'Outerwear', 'Accessories'];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
      ),
      child: Wrap(
        spacing: 8.0, // Space between chips
        children: [
          createDropdownButton(
              "All Clothes", selectedAllClothes, allClothesOptions),
          SizedBox(width: 5.v),
          // createDropdownButton("Season", selectedSeason, seasonOptions),
          SizedBox(width: 5.v),
          createDropdownButton("Occasion", selectedOccasion, occasionOptions),
          SizedBox(width: 5.v),
          // createDropdownButton("Category", selectedCategory, categoryOptions),
        ],
      ),
    );
  }

  Widget createDropdownButton(
      String label, String selectedValue, List<String> options) {
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
              switch (label) {
                case 'All Clothes':
                  selectedAllClothes = newValue!;
                  break;
                // case 'Season':
                //   selectedSeason = newValue!;
                //   break;
                case 'Occasion':
                  selectedOccasion = newValue!;
                  break;
                // case 'Category':
                //   selectedCategory = newValue!;
                //   break;
              }
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
