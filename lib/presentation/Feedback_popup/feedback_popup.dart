import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/custom_elevated_button.dart';
import 'package:sdgp_test01/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: must_be_immutable
class Feedback_popup extends StatelessWidget {
  Feedback_popup({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController thoughtController = TextEditingController();
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
          SizedBox(height: 30.v),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1), // Black border with desired width
              borderRadius: BorderRadius.circular(20), // 20 border radius
            ),
            child: SizedBox(
              height: 80.v,
              width: 211.h,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomTextFormField(
                      height: 50.v, // Increased height
                      width: 211.h,
                      hintText: "Type your thoughts...",
                      hintStyle: TextStyle(
                        fontSize: 12,
                      ),
                      // Assuming you can pass decoration or border properties
                      // Remove or modify these properties as needed
                      decoration: InputDecoration(
                        border: InputBorder.none, // Removes border
                        // Other decoration properties
                      ),
                      // Include other relevant properties as required
                    ),
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 17.h, bottom: 40.v), // Adjust top padding if necessary
                      child: Container(
                        width: 90.h,
                        height: 20.v,
                        alignment: Alignment.center, // To center the text inside the container
                        decoration: BoxDecoration(
                          color: Colors.white, // Assuming the button has a white background
                          // Add more styling as needed (e.g., borderRadius, boxShadow)
                        ),
                        child: Text(
                          "Description",
                          style: TextStyle(
                            // Add your text style here
                            // For example: color, fontSize, fontWeight
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 18.v),
          CustomTextFormField(
            width: 211.h,
            controller: emailController,
            hintText: "Enter your email",
            fontSize: 16.0, // Set font size to 16
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.emailAddress,
            borderDecoration: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), // Set the border radius if needed
              borderSide: BorderSide(color: Colors.black, width: 1), // Black border
            ),
          ),
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
    Navigator.pop(context);
  }

  /// Navigates to the frame675Screen when the action is triggered.
  onTapTxtSend(BuildContext context) async {
    await FirebaseFirestore.instance.collection('feedback').add({
      'email': emailController.text,
      'thoughts': thoughtController.text,
    });
    Navigator.pushNamed(context, AppRoutes.settings);
  }
}
