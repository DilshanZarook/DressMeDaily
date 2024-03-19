import 'package:flutter/material.dart';
// Import the respective pages and app theme
import 'package:DressMeDaily/presentation/Outfit_page/My_selection_page.dart';
import 'package:DressMeDaily/presentation/Outfit_page/AI_selection_page.dart';
import 'package:DressMeDaily/presentation/Outfit_page/Favorite_page.dart';
import 'package:DressMeDaily/core/app_export.dart'; // Assuming this is your theme file

class Outfit_page extends StatefulWidget {
  Outfit_page({Key? key}) : super(key: key);

  @override
  Outfit_pageState createState() => Outfit_pageState();
}

class Outfit_pageState extends State<Outfit_page> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 30.v),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton(0, "My Selection"),
                buildButton(2, "Favorites"),
              ],
            ),
          ),
          SizedBox(height: 30.v),

          Expanded(
            child: _getContentForSelectedIndex(),
          ),
        ],
      ),
    );
  }

  Widget buildButton(int index, String title) {
    bool isSelected = index == selectedIndex;
    return InkWell(
      onTap: () async {
        setState(() {
          selectedIndex = index;
        });
        await Future.delayed(Duration(milliseconds: 200));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 10.v),
        decoration: BoxDecoration(
          color: isSelected ? appTheme.lime400 : appTheme.blueGray100,
          borderRadius: BorderRadius.circular(17.h),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.black : appTheme.black900,
            fontSize: 10.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _getContentForSelectedIndex() {
    switch (selectedIndex) {
      case 0:
        return My_selection_page();
      case 2:
        return Favorite_page();
      default:
        return Container(); // Fallback for undefined index
    }
  }
}
