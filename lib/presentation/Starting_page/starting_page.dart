import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/custom_outlined_button.dart';

class Starting_page extends StatelessWidget {
  const Starting_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Ensures the stack fills the entire screen
        children: [
          // Background image
          Image.asset(
            'assets/images/ward_start_page.jpg', // Replace with your image asset path
            fit: BoxFit.cover, // Ensures the background image covers the whole screen
          ),
          // Your container with all content, use a transparent color to see the background
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 85.v),
            color: Colors.transparent, // Ensures container background is transparent
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16.v),
                Container(
                  height: 400.v,
                  width: 360.v,
                  margin: EdgeInsets.only(left: 3.h, right: 10.h),
                  child: Text("Ready to create your \nown AI wardrobe?",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,

                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontSize: 32, // Set the font size to 16
                      fontWeight: FontWeight.w600, // Set the font weight to 300
                    ) ?? const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),),
                ),
                const Spacer(),
                CustomOutlinedButton(
                    height: 50.v,
                    width: 160.h,
                    text: "Continue..",
                    buttonStyle: CustomButtonStyles.outlineBlackTL20,
                    buttonTextStyle: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 28, // Set the font size to 16
                      fontWeight: FontWeight.w500, // Set the font weight to 300
                    ),
                    onPressed: () {
                      onTapContinue(context);
                    }
                ),

                SizedBox(height: 37.v),
                _buildAreYouAlreadyRow(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAreYouAlreadyRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 6.v, bottom: 2.v),
          child: Text(
            "Are you already a user? ",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: 18, // Set the font size to 16
              fontWeight: FontWeight.w500, // Set the font weight to 300
            ) ?? const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onTapTxtSignup(context);
          },
          child: Container(
            width: 60.h,
            padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 3.v),
            decoration: AppDecoration.outlineBlack.copyWith(
              color: Colors.blue, // Set the container background color to blue
              borderRadius: BorderRadius.circular(17.v), // Apply the border radius
              // If AppDecoration.outlineBlack already has a border, this will keep it, while also setting the color to blue.
            ),
            child: Text(
              "sign in",
              style: CustomTextStyles.titleLargeWhiteA700?.copyWith(
                color: Colors.white,
                fontSize: 14.v, // Set the font size
                fontWeight: FontWeight.w400, // Set the font weight
              ) ?? TextStyle(
                fontSize: 16.v,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),

        ),
      ],
    );
  }


  /// Navigates to the frame243Screen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.login_page_1);
  }

  /// Navigates to the frameFiftynineScreen when the action is triggered.
  onTapTxtSignup(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.starting_page_signup);
  }
}
