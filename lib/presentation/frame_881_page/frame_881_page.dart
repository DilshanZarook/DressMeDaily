import '../frame_881_page/widgets/frame2_item_widget.dart';
import '../frame_881_page/widgets/frame4_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/frame_406_bottomsheet/frame_406_bottomsheet.dart';

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
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            children: [
              SizedBox(height: 40.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjust spacing as needed
                children: [
                  buildButton1(context),
                  buildButton2(context),
                  buildButton3(context),
                ],
              ),
              SizedBox(height: 25.v),
              _buildFrame1(context),
              SizedBox(height: 15.v),
              CustomImageView(
                imagePath: ImageConstant.imgFrame877,
                height: 285.v,
                width: 360.h,
              ), _buildStickyCustomIconButtonTop(context),
            ],
          ),
        )
    );
  }

  /// Section Widget
  Widget _buildStickyCustomIconButtonTop(BuildContext context) {
    return Positioned(
      right: 7.h,
      bottom: 10.h,
      child: GestureDetector(
        onTap: () {
          // Using the showGeneralDialog method with the SlideTransition animation
          showGeneralDialog(
            context: context,
            pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
              return Frame406Bottomsheet();
            },
            barrierDismissible: true,
            barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
            transitionDuration: const Duration(milliseconds: 600),
            transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
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
          height: 35.adaptSize,
          width: 80.adaptSize,
          padding: EdgeInsets.all(6.h),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Text(
            "Archive",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
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
            color: isButton1Selected ? Colors.white : appTheme.black900, // Change text color based on selection
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
            color: isSelected2 ? Colors.white : appTheme.black900, // Change text color based on selection
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
          MaterialPageRoute(builder: (context) => Frame881Page()),
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
          "Other Selection",
          style: TextStyle(
            color: isSelected3 ? Colors.white : appTheme.black900, // Change text color based on selection
            fontSize: 10.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame1(BuildContext context) {
    return Frame4ItemWidget();
  }


}
