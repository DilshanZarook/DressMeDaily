import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/custom_outlined_button.dart';
import '../Starting_page/starting_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Adjust the path as necessary


class Starting_page_signup extends StatelessWidget {
  const Starting_page_signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 22.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 22.v),
                      CustomOutlinedButton(
                          height: 70.v,
                          width: 300.v,
                          text: "Continue with Google",
                          buttonTextStyle: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          leftIcon: Container(
                              margin: EdgeInsets.only(right: 20.h),
                              child: CustomImageView(
                                  imagePath:
                                      ImageConstant.imgOipremovebgpreview1,
                                  height: 25.adaptSize,
                                  width: 25.adaptSize)),
                          buttonStyle: CustomButtonStyles.outlineBlackTL20,
                          onPressed: () {
                            onTapContinueWithGoogle(context);
                          }),
                      SizedBox(height: 62.v),
                      GestureDetector(
                        onTap: () {
                          onTapFrame(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Other options",

                              style: CustomTextStyles.titleLargeGray70002,
                            ),
                            SvgPicture.asset(
                              'assets/images/img_arrow_right.svg',
                              height: theme.textTheme.titleLarge!.fontSize,
                              width: theme.textTheme.titleLarge!.fontSize,
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
        icon: Image.asset('assets/images/Line arrow-left.png'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Starting_page()),
          );
        },
      ),
    );
  }

  /// Navigates to the frame287Screen when the action is triggered.
  onTapContinueWithGoogle(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loading_page_3);
  }

  /// Navigates to the frame286Screen when the action is triggered.
  onTapFrame(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signin_other_options);
  }
}
