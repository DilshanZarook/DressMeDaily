import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/custom_elevated_button.dart';
import 'package:sdgp_test01/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class Frame634Dialog extends StatelessWidget {
  Frame634Dialog({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 247.h,
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 13.v),
        decoration: AppDecoration.fillGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text("Please provide us your feedback",
              style: theme.textTheme.bodySmall),
          SizedBox(height: 5.v),
          SizedBox(
            height: 106.v,
            width: 211.h,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomTextFormField(
                    height: 70.v,
                    width: 211.h,
                    hintText: "Type your thoughts...",
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                    borderDecoration: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.h),
                      borderSide: BorderSide(
                        color: appTheme.gray500,
                        width: 1.h,
                      ),
                    ),
                    // Include other relevant properties as required
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.h, top: 20.v), // Adjust top padding if necessary
                    child: CustomElevatedButton(
                      width: 90.h,
                      text: "Description",
                      removeEffects: true, // This will remove the background shadow but keep the white background
                    ),
                  ),
                ),
              ],
            ),
          ),


          SizedBox(height: 18.v),
          CustomTextFormField(
              width: 211.h,
              fontSize: 16.0,
              controller: emailController,
              hintText: "Enter your email",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.emailAddress),
          SizedBox(height: 18.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 15.h, right: 22.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              onTapTxtCancel(context);
                            },
                            child: Text("Cancel",
                                style: CustomTextStyles.bodySmallGray70004)),
                        GestureDetector(
                            onTap: () {
                              onTapTxtSend(context);
                            },
                            child: Text("Send",
                                style: CustomTextStyles.bodySmallGray70004))
                      ])))
        ]));
  }

  /// Navigates to the frame633Screen when the action is triggered.
  onTapTxtCancel(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.frame_633_screen);
  }

  /// Navigates to the frame675Screen when the action is triggered.
  onTapTxtSend(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.frame_675_screen);
  }
}
