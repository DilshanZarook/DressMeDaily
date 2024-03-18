import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/custom_outlined_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Starting_page/starting_page.dart'; // Adjust the path as necessary

class RegisterNewUser extends StatelessWidget {
  const RegisterNewUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 36.h, vertical: 140.v),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300.h,
              child: Text(
                "Plan your fashion life\nwith us",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: (theme.textTheme.bodyLarge
                        ?.copyWith(fontSize: 24.v)) ??
                    TextStyle(
                      fontSize: 24.v,
                    ),
              ),
            ),
            const Spacer(),
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
            SizedBox(height: 15.v),
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
            SizedBox(height: 15.v),
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
          ],
        ),
      ),
    );
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



  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset('assets/images/Line arrow-left.png'),
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

  onTapContinueWithEmail(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loading_page_1);
  }

  onTapContinueWithGoogle(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.google_sign_in);
  }

  onTapContinueWithFacebook(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profile_picture);
  }
}
