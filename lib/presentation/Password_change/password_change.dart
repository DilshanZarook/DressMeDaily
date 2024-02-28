import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/custom_outlined_button.dart';
import 'package:sdgp_test01/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class Password_change extends StatelessWidget {
  Password_change({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 35.v),
                child: Column(children: [
                  Container(
                      height: 6.v,
                      width: double.maxFinite,
                      decoration: BoxDecoration(color: appTheme.black900),

                      child: LinearProgressIndicator(
                          value: 0.40,
                          backgroundColor: appTheme.black900,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              appTheme.lime400))),
                  const Spacer(),
                  SizedBox(height: 150.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 48.h),
                          child: Text("Email:",
                              style: theme.textTheme.bodyLarge))),
                  SizedBox(height: 8.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 48.h),
                      child: CustomTextFormField(
                          controller: emailController,
                          textInputAction: TextInputAction.done)),
                  const Spacer(flex: 27),
                  CustomOutlinedButton(
                      height: 44.v,
                      width: 83.h,
                      text: "Submit",
                      buttonStyle: CustomButtonStyles.outlineBlackTL103,
                      onPressed: () {
                        onTapSubmit(context);
                      }),
                  const Spacer(flex: 43)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset('assets/images/Line arrow-left.png'), // Replace with your actual arrow image asset path
        onPressed: () {
          Navigator.of(context).pop();
        },
      ), // Replace with your screen's title
      // You can add more AppBar properties if needed
    );
  }
bool isValidEmail(String email) {
final emailRegex = RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
return emailRegex.hasMatch(email);
}


/// Navigates to the frame270Screen when the action is triggered.
  onTapSubmit(BuildContext context) {
    String email = emailController.text;

    if (!isValidEmail(email)) {
      // Show error message for invalid email
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Invalid Email"),
            content: const Text("Please enter a valid email address."),
            actions: <Widget>[
              TextButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    // If email is valid, proceed with navigation
    Navigator.pushNamed(context, AppRoutes.password_mail);
  }

}
