import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/custom_outlined_button.dart';
import '../Starting_page_signup/starting_page_signup.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Signin_other_options extends StatelessWidget {
  const Signin_other_options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 36.h, top: 193.v, right: 36.h),
                child: Column(children: [
                  CustomOutlinedButton(
                    text: "Continue with Google",

                    // Assuming the widget supports this property
                    leftIcon: Container(

                      margin: EdgeInsets.only(right:32.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgOipremovebgpreview1,
                        height: 20.v,
                        width: 19.h,
                      ),
                    ),
                    buttonTextStyle: CustomTextStyles.bodyLarge16.copyWith(
                      color: Colors.black, // Text color - white
                    ),
                    onPressed: () {
                      onTapContinueWithGoogle(context);
                    },
                  ),
                  SizedBox(height: 20.v),
                  CustomOutlinedButton(
                    text: "Continue with Facebook",
                    leftIcon: Container(
                      padding: EdgeInsets.all(2.h),
                      margin: EdgeInsets.only(right: 20.h),
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: SvgPicture.asset(
                        'assets/images/img_facebook.svg', // Replace with your actual asset path
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                      ),
                    ),
                    buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color - blue
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // BorderRadius of 20
                      ),
                    ),
                    buttonTextStyle: CustomTextStyles.bodyLarge16.copyWith(
                      color: Colors.white, // Text color - white
                    ),
                    onPressed: () {
                      onTapContinueWithFacebook(context);
                    },
                  ),
                  SizedBox(height: 20.v),
                  CustomOutlinedButton(
                      text: "Continue with email",
                      buttonTextStyle: CustomTextStyles.bodyLarge16.copyWith(
                        color: Colors.black, // Text color - white
                      ),
                      onPressed: () {
                        onTapContinueWithEmail(context);
                      }),
                  SizedBox(height: 5.v)
                ])));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset('assets/images/Line arrow-left.png'), // Adjust the path to your asset
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Starting_page_signup()),
          );
        },
      ),
      // Rest of your AppBar properties...
    );
  }

  /// Navigates to the frame287Screen when the action is triggered.
  onTapContinueWithGoogle(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loading_page_3);
  }

  /// Navigates to the frame287Screen when the action is triggered.
  onTapContinueWithFacebook(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loading_page_3);
  }

  /// Navigates to the frame268Screen when the action is triggered.
  onTapContinueWithEmail(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signup_old_user);
  }
}
