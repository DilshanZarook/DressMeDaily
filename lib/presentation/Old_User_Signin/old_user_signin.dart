import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Starting_page/starting_page.dart';
import 'package:sdgp_test01/widgets/custom_outlined_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OldUserSignin extends StatelessWidget {
  const OldUserSignin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 36.h, top: 193.v, right: 36.h),
            child: Column(children: [
              _buildButton(
                text: "Continue with Email",
                leftIcon: Container(
                  padding: EdgeInsets.all(2.h),
                  margin: EdgeInsets.only(right: 40.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgEmail,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                  ),
                ),
                onPressed: () {
                  onTapContinueWithEmail(context);
                },
              ),
              SizedBox(height: 20.v),
              _buildButton(
                text: "Continue with Google",
                leftIcon: Container(
                  margin: EdgeInsets.only(right: 40.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgGoogle,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                  ),
                ),
                onPressed: () {
                  onTapContinueWithGoogle(context);
                },
              ),
              SizedBox(height: 20.v),
              _buildButton(
                text: "Continue with Facebook",
                leftIcon: Container(
                  padding: EdgeInsets.all(2.h),
                  margin: EdgeInsets.only(right: 20.h),
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: SvgPicture.asset(
                    'assets/images/img_facebook.svg',
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                  ),
                ),
                onPressed: () {
                  onTapContinueWithFacebook(context);
                },
              ),
              SizedBox(height: 5.v)
            ])));
  }

  Widget _buildButton({
    required String text,
    required Widget leftIcon,
    required VoidCallback onPressed,
  }) {
    return CustomOutlinedButton(
      text: text,
      leftIcon: leftIcon,
      buttonStyle: CustomButtonStyles.outlineBlackTL20,
      buttonTextStyle: CustomTextStyles.bodyLarge16.copyWith(
        color: Colors.black, // Adjust text color
      ),
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(20.0), // Pass a BorderRadius instance
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset(
            'assets/images/Line arrow-left.png'), // Adjust the path to your asset
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Starting_page()),
          );
        },
      ),
      // Rest of your AppBar properties...
    );
  }

  /// Navigates to the frame268Screen when the action is triggered.
  onTapContinueWithEmail(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signup_old_user);
  }

  /// Navigates to the frame287Screen when the action is triggered.
  onTapContinueWithGoogle(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loading_page_3);
  }

  /// Navigates to the frame287Screen when the action is triggered.
  onTapContinueWithFacebook(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loading_page_3);
  }
}
