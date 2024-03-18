import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/All_clothes_outfit_page/All_clothes_outfit.dart';
import 'package:sdgp_test01/presentation/My_selection_Top_wear/Top_wear_Selection.dart';
import 'package:sdgp_test01/presentation/frame_405_bottomsheet/frame_405_bottomsheet.dart';
import '../frame_881_page/widgets/frame4_item_widget.dart';

// ignore_for_file: must_be_immutable
class Outfit_page extends StatefulWidget {
  Outfit_page({Key? key}) : super(key: key);

  @override
  Outfit_pageState createState() => Outfit_pageState();
}

class Outfit_pageState extends State<Outfit_page> {
  bool isButton1Selected = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  final Color darkBoxColor = Colors.brown; // Example color for dark boxes
  final Color lightBoxColor = Colors.grey[300]!;
  String? selectedImageUrl; // Variable to hold the selected image URL
  bool isDarkBoxSelected = false;
  bool isDarkBoxSelected_1 = false;

  @override
  bool get wantKeepAlive => true;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              decoration: AppDecoration.fillWhiteA,
              // Define your fillWhiteA decoration
              child: Column(
                children: [
                  SizedBox(height: 40.v),
                  // Use appropriate value or context variable
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton1(context),
                      buildButton2(context),
                      buildButton3(context),
                    ],
                  ),
                  SizedBox(height: 25.v),
                  // Use appropriate value or context variable
                  _buildSelectedContent(),
                  SizedBox(height: 15.v),
                  // Use appropriate value or context variable
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Container for dark boxes with greater height
                      Container(
                        height: 490,
                        width: 320,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20),
                            _buildDarkBoxSection(),
                            SizedBox(height: 20), // Space between the boxes
                            _buildDarkBoxSection1(),
                          ],
                        ),
                      ),
                      // Column for light boxes without an additional container


                    ],
                  ),
                  SizedBox(height: 30.h),
                  CustomContainerSection(onImageSelected: (String url) {
                    if (isDarkBoxSelected  ){
                      setState(() {
                        selectedImageUrl = url;
                        isDarkBoxSelected = false; // Reset the flag
                      });
                    }
                    else if ( isDarkBoxSelected_1){
                      setState(() {
                        selectedImageUrl = url;
                        isDarkBoxSelected_1 = false; // Reset the flag
                      });
                    }
                  }),

                  SizedBox(height: 20.v),
                  // Use appropriate value or context variable
                  // This space is to account for the floating button's space
                ],
              ),
            ),
          ),
          // _buildStickyCustomIconButtonTop(context),
          // Positioned outside and above the SingleChildScrollView
        ],
      ),
    );
  }

  Widget _buildDarkBoxSection() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDarkBoxSelected = true;
        });
      },
      child: Container(
        width: 200.v, // Replace .v with actual values or calculations if needed
        height: 160.v, // Replace .v with actual values or calculations if needed
        decoration: BoxDecoration(
          color: darkBoxColor,
          borderRadius: BorderRadius.circular(20), // Set border radius here
          image: selectedImageUrl != null ? DecorationImage(
            image: NetworkImage(selectedImageUrl!),
            fit: BoxFit.cover,
          ) : null,
        ),
        child: selectedImageUrl == null
            ? Center(child: Text('Select a Topwaer')) // Prompt to select image
            : null,
      ),
    );
  }
  Widget _buildDarkBoxSection1() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDarkBoxSelected_1 = true;
        });
      },
      child: Container(
        width: 200.v, // Replace .v with actual values or calculations if needed
        height: 160.v, // Replace .v with actual values or calculations if needed
        decoration: BoxDecoration(
          color: darkBoxColor,
          borderRadius: BorderRadius.circular(20), // Set border radius here
          image: selectedImageUrl != null ? DecorationImage(
            image: NetworkImage(selectedImageUrl!),
            fit: BoxFit.cover,
          ) : null,
        ),
        child: selectedImageUrl == null
            ? Center(child: Text('Select a bottomwear')) // Prompt to select image
            : null,
      ),
    );
  }


  Widget buildButton(BuildContext context, int index, String text) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 10.v),
        decoration: BoxDecoration(
          color:
              selectedIndex == index ? appTheme.lime400 : appTheme.blueGray100,
          borderRadius: BorderRadius.circular(17.h),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedIndex == index ? Colors.black : appTheme.black900,
            fontSize: 10.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedContent() {
    switch (selectedIndex) {
      case 0:
        return Frame4ItemWidget(); // Widget for "My Selection"
      case 1:
        return Text("Choose our style"); // Widget for "AI Selection"
      // case 2:
      //   return Bookmark_page(); // Widget for "Favorites"
      default:
        return Container();
    }
  }

  @override
  Widget buildButton1(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          isButton1Selected = true;
        });
        await Future.delayed(Duration(milliseconds: 200));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Outfit_page()),
        );

        // Reset the state if needed
        setState(() {
          isButton1Selected = false;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 10.v),
        decoration: BoxDecoration(
          color: isButton1Selected ? appTheme.lime400 : appTheme.blueGray100,
          borderRadius: BorderRadius.circular(17.h),
        ),
        child: Text(
          "My Selection",
          style: TextStyle(
            color: isButton1Selected ? Colors.white : appTheme.black900,
            // Change text color based on selection
            fontSize: 10.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget buildButton2(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          isSelected2 = true;
        });
        await Future.delayed(Duration(milliseconds: 200));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Outfit_page()),
        );

        // Reset the state if needed
        setState(() {
          isSelected2 = false;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 10.v),
        decoration: BoxDecoration(
          color: isSelected2 ? appTheme.lime400 : appTheme.lime400,
          borderRadius: BorderRadius.circular(17.h),
        ),
        child: Text(
          "AI Selection",
          style: TextStyle(
            color: isSelected2 ? Colors.white : appTheme.black900,
            // Change text color based on selection
            fontSize: 10.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

Widget buildButton3(BuildContext context) {
  return InkWell(
    onTap: () async {
      setState(() {
        isSelected3 = true;
      });
      await Future.delayed(Duration(milliseconds: 200));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Frame405Bottomsheet()),
      );

      // Reset the state if needed
      setState(() {
        isSelected3 = false;
      });
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 10.v),
      decoration: BoxDecoration(
        color: isSelected3 ? appTheme.lime400 : appTheme.blueGray100,
        borderRadius: BorderRadius.circular(17.h),
      ),
      child: Text(
        "Favorites",
        style: TextStyle(
          color: isSelected3 ? Colors.white : appTheme.black900,
          // Change text color based on selection
          fontSize: 10.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

  /// Section Widget
}
