import 'package:flutter/material.dart';
import 'package:DressMeDaily/core/app_export.dart';
import 'package:DressMeDaily/widgets/custom_outlined_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Starting_page/starting_page.dart'; // Adjust the path as necessary


class Login_page_1 extends StatelessWidget {
  const Login_page_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding:
                    EdgeInsets.symmetric(horizontal: 36.h, vertical: 183.v),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300.h, // Ensure .h is a valid extension method for your context
                        child: Text(
                          "Plan your fashion life\nwith us",
                          maxLines: 2, // Adjusted to 2 for two lines of text
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: (theme.textTheme.bodyLarge?.copyWith(fontSize: 24.v)) ??
                              TextStyle(fontSize: 24.v), // Provide a default style if bodyLarge is null
                        ),
                      ),
                      const Spacer(),
                      CustomOutlinedButton(
                          text: "Continue with Google",
                          leftIcon: Container(
                              margin: EdgeInsets.only(right: 24.h),
                              child: CustomImageView(
                                  imagePath:
                                      ImageConstant.imgOipremovebgpreview1,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize)),
                          buttonStyle: CustomButtonStyles.outlineBlackTL20,
                          buttonTextStyle: theme.textTheme.bodyLarge!,
                          onPressed: () {
                            e(context);
                          }),
                      SizedBox(height: 29.v),
                      GestureDetector(
                        onTap: () {
                          onTapFrame(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center, // Aligns the icon vertically with the text
                          children: [
                            Text(
                              "Other options",
                              style: CustomTextStyles.titleLargeGray70002,
                            ),
                            SvgPicture.asset(
                              'assets/images/img_arrow_right.svg', // Use your actual asset path
                              height: theme.textTheme.titleLarge!.fontSize, // Match the text size
                              width: theme.textTheme.titleLarge!.fontSize, // Match the text size
                            ),
                          ],
                        ),
                      )

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
            MaterialPageRoute(builder: (context) => const Starting_page()),
          );
        },
      ),
    );
  }

  /// Navigates to the frame290Screen when the action is triggered.
  e(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profile_picture);
  }

  /// Navigates to the frame276Screen when the action is triggered.
  onTapFrame(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signup_other_options);
  }
}
