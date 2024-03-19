import 'package:flutter/material.dart';
import 'package:DressMeDaily/core/app_export.dart';
import 'package:DressMeDaily/widgets/custom_outlined_button.dart';

class Starting_page extends StatelessWidget {
  const Starting_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/ward_start_page.jpg',
            fit: BoxFit.cover,
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 85.v),
            color: Colors.transparent,
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
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
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
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
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
              fontSize: 18,
              fontWeight: FontWeight.w500,
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
            width: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.v),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(17.v),
            ),
            child: Text(
              "sign in",
              style: CustomTextStyles.titleLargeWhiteA700?.copyWith(
                color: Colors.white,
                fontSize: 12.v,
                fontWeight: FontWeight.w400,
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
