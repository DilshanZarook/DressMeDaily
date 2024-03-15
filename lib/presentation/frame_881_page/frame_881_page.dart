import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/My_selection_Top_wear/Top_wear_Selection.dart';

import '../frame_881_page/widgets/frame4_item_widget.dart';

// ignore_for_file: must_be_immutable
class Frame881Page extends StatefulWidget {
  Frame881Page({Key? key}) : super(key: key);

  @override
  Frame881PageState createState() => Frame881PageState();
}

class Frame881PageState extends State<Frame881Page> {
  bool isButton1Selected = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  final Color darkBoxColor = Colors.brown; // Example color for dark boxes
  final Color lightBoxColor = Colors.grey[300]!;

  @override
  bool get wantKeepAlive => true;
  int selectedIndex = 0;

  @override
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
                      buildButton(context, 0, "My Selection"),
                      buildButton(context, 1, "AI Selection"),
                      // buildButton(context, 2, "Favorites"),
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
                        height: 400,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 20),
                            _buildDarkBoxSection(),
                            const SizedBox(height: 20), // Space between the boxes
                            _buildDarkBoxSection(),
                          ],
                        ),
                      ),
                      // Column for light boxes without an additional container
                      Column(
                        children: <Widget>[
                          _buildLightBoxSection(),
                          const SizedBox(height: 50), // Space between the boxes
                          _buildLightBoxSection(),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 80.v),
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
    return Container(
      width: 150.v, // Replace .v with actual values or calculations if needed
      height: 125.v, // Replace .v with actual values or calculations if needed
      decoration: BoxDecoration(
        color: darkBoxColor,
        borderRadius: BorderRadius.circular(20), // Set border radius here
      ),
    );
  }

  Widget _buildLightBoxSection() {
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return const Top_wear_Selection();
          },
          barrierDismissible: true,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          transitionDuration: const Duration(milliseconds: 600),
          transitionBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
      child: Container(
        width: 120, // Adjust the width if needed
        height: 120, // Adjust the height if needed
        decoration: BoxDecoration(
          color: lightBoxColor,
          borderRadius: BorderRadius.circular(20), // Set border radius here
        ),
      ),
    );
  }

  // Section Widget
  // Widget _buildStickyCustomIconButtonTop(BuildContext context) {
  //   return Positioned(
  //     top: 220.0,  // Top offset
  //     right: 50.0, // Right offset
  //     child: GestureDetector(
  //       onTap: () {
  //         // Using the showGeneralDialog method with the SlideTransition animation
  //         showGeneralDialog(
  //           context: context,
  //           pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
  //             return Frame406Bottomsheet();
  //           },
  //           barrierDismissible: true,
  //           barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
  //           transitionDuration: const Duration(milliseconds: 600),
  //           transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  //             return SlideTransition(
  //               position: Tween<Offset>(
  //                 begin: const Offset(0, 1),
  //                 end: Offset.zero,
  //               ).animate(animation),
  //               child: child,
  //             );
  //           },
  //         );
  //       },
  //       child: Container(
  //         height: 35.adaptSize,
  //         width: 80.adaptSize,
  //         padding: EdgeInsets.all(6.h),
  //         decoration: BoxDecoration(
  //           color: Colors.blueAccent,
  //           borderRadius: BorderRadius.circular(40),
  //         ),
  //         child: Text(
  //           "Archive",
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 16,
  //           ),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
          MaterialPageRoute(builder: (context) => Frame881Page()),
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
          MaterialPageRoute(builder: (context) => Frame881Page()),
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

// Widget buildButton3(BuildContext context) {
//   return InkWell(
//     onTap: () async {
//       setState(() {
//         isSelected3 = true;
//       });
//       await Future.delayed(Duration(milliseconds: 200));
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Bookmark_page()),
//       );
//
//       // Reset the state if needed
//       setState(() {
//         isSelected3 = false;
//       });
//     },
//     child: Container(
//       padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 10.v),
//       decoration: BoxDecoration(
//         color: isSelected3 ? appTheme.lime400 : appTheme.blueGray100,
//         borderRadius: BorderRadius.circular(17.h),
//       ),
//       child: Text(
//         "Favorites",
//         style: TextStyle(
//           color: isSelected3 ? Colors.white : appTheme.black900,
//           // Change text color based on selection
//           fontSize: 10.fSize,
//           fontFamily: 'Inter',
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//     ),
//   );
// }

  /// Section Widget
}
