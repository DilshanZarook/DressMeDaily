import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Settings/settings.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/widgets/custom_outlined_button.dart';
import 'package:sdgp_test01/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class Signup_new_user extends StatefulWidget {
  Signup_new_user({Key? key}) : super(key: key);

  @override
  State<Signup_new_user> createState() => _Signup_new_userState();
}

class _Signup_new_userState extends State<Signup_new_user> {
  final emailEditTextController = TextEditingController();

  final usernameEditTextController = TextEditingController();

  final passwordEditTextController = TextEditingController();

  // sign user up method
  void signUserUp() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try creating the user
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailEditTextController.text,
        password: passwordEditTextController.text,
      );

      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
    }
  }

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
                          valueColor:
                              AlwaysStoppedAnimation<Color>(appTheme.lime400))),
                  Spacer(),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 44.h),
                          child: Text("Email:",
                              style: theme.textTheme.bodyLarge))),
                  SizedBox(height: 14.v),
                  _buildEmailEditText(context),
                  SizedBox(height: 20.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 44.h),
                          child: Text("Username:",
                              style: theme.textTheme.bodyLarge))),
                  SizedBox(height: 14.v),
                  _buildUsernameEditText(context),
                  SizedBox(height: 29.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 44.h),
                          child: Text("Password:",
                              style: theme.textTheme.bodyLarge))),
                  SizedBox(height: 5.v),
                  _buildPasswordEditText(context),
                  SizedBox(height: 66.v),
                  _buildSubmitButton(context),
                  SizedBox(height: 60.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset(
            'assets/images/Line arrow-left.png'), // Replace with your actual arrow image asset path
        onPressed: () {
          Navigator.of(context).pop();
        },
      ), // Replace with your screen's title
      // You can add more AppBar properties if needed
    );
  }

  /// Section Widget
  Widget _buildEmailEditText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 37.h, right: 35.h),
        child: CustomTextFormField(controller: emailEditTextController));
  }

  /// Section Widget
  Widget _buildUsernameEditText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 37.h, right: 35.h),
        child: CustomTextFormField(controller: usernameEditTextController));
  }

  /// Section Widget
  Widget _buildPasswordEditText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 37.h, right: 35.h),
        child: CustomTextFormField(
            controller: passwordEditTextController,
            textInputAction: TextInputAction.done,
            obscureText: true));
  }

  /// Section Widget
  Widget _buildSubmitButton(BuildContext context,
      {double borderRadius = 20.0}) {
    return Container(
      height: 50.v, // Height of the button
      width: 100.h, // Width of the button
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(borderRadius), // Custom border radius
        border: Border.all(color: Colors.black), // Border style
        // Add other decoration properties if needed, like color, boxShadow
      ),
      child: TextButton(
        onPressed: () {
          onTapSubmitButton(context); // Your tap handler
        },
        child: Text(
          "Submit",
          style: TextStyle(
            color: Colors.black, // Text color
            // Add other text styling properties if needed
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegex.hasMatch(email);
  }

  /// Navigates to the frame278Screen when the action is triggered.
  onTapSubmitButton(BuildContext context) {
    // String email = emailEditTextController.text;

    // if (!isValidEmail(email)) {
    //   // Show error message for invalid email
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text("Invalid Email"),
    //         content: Text("Please enter a valid email address."),
    //         actions: <Widget>[
    //           TextButton(
    //             child: Text("Close"),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    //   return;
    // }

    signUserUp();

    // If email is valid, proceed with navigation
    // Navigator.pushNamed(context, AppRoutes.profile_picture);
  }
}
