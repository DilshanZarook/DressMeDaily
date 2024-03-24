import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/custom_outlined_button.dart';
import 'package:sdgp_test01/widgets/custom_text_form_field.dart';
import '../Signin_other_options/signin_other_options.dart';

class Signup_old_user extends StatelessWidget {
  Signup_old_user({Key? key}) : super(key: key);

  TextEditingController editTextController = TextEditingController();
  TextEditingController editTextController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding:
                EdgeInsets.symmetric(horizontal: 17.h, vertical: 130.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 71.v),
                      Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: Text("Username:",
                              style: theme.textTheme.bodyLarge)),
                      SizedBox(height: 10.v),
                      CustomTextFormField(controller: editTextController),
                      SizedBox(height: 37.v),
                      Padding(
                          padding: EdgeInsets.only(left: 13.h),
                          child: Text("Password:",
                              style: theme.textTheme.bodyLarge)),
                      SizedBox(height: 9.v),
                      CustomTextFormField(
                          controller: editTextController1,
                          textInputAction: TextInputAction.done,
                          obscureText: true),
                      SizedBox(height: 9.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtForgotPassword(context);
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(right: 20.h),
                                  child: Text("Forgot password..",
                                      style: CustomTextStyles
                                          .bodyMediumGray700)))),
                      const Spacer(),
                      CustomOutlinedButton(
                          height: 40.v,
                          width: 100.h,
                          text: "Submit",
                          buttonStyle: CustomButtonStyles.outlineBlackTL103,
                          onPressed: () {
                            onTapSubmit(context);
                          },
                          alignment: Alignment.center)
                    ])));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset('assets/images/Line arrow-left.png'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Signin_other_options()),
          );
        },
      ),
    );
  }

  onTapTxtForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.password_change);
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegex.hasMatch(email);
  }

  onTapSubmit(BuildContext context) async {
    String email = editTextController.text;
    String password = editTextController1.text;

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

    Navigator.pushNamed(context, AppRoutes.loading_page_2);
  }
}
