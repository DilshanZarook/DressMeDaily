import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/custom_outlined_button.dart';
import 'package:sdgp_test01/widgets/custom_text_form_field.dart';
import '../Old_User_Signin/old_user_signin.dart';

// ignore_for_file: must_be_immutable
class Signup_old_user extends StatefulWidget {
  Signup_old_user({Key? key}) : super(key: key);

  @override
  State<Signup_old_user> createState() => _Signup_old_userState();
}

class _Signup_old_userState extends State<Signup_old_user> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password bro!!');
      }
    }

    // pop the loading circle
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 130.v),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 71.v),
                  Padding(
                      padding: EdgeInsets.only(left: 14.h),
                      child: Text("Email:", style: theme.textTheme.bodyLarge)),
                  SizedBox(height: 10.v),
                  CustomTextFormField(controller: emailController),
                  SizedBox(height: 37.v),
                  Padding(
                      padding: EdgeInsets.only(left: 13.h),
                      child:
                          Text("Password:", style: theme.textTheme.bodyLarge)),
                  SizedBox(height: 9.v),
                  CustomTextFormField(
                      controller: passwordController,
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
                              child: Text("Forgot password",
                                  style: CustomTextStyles.bodyMediumGray700)))),
                  const Spacer(),
                  CustomOutlinedButton(
                    height: 40.v,
                    width: 100.h,
                    text: "Submit",
                    buttonStyle: CustomButtonStyles.outlineBlackTL103,
                    onPressed: () {
                      signUserIn();
                    },
                    alignment: Alignment.center,
                    borderRadius: BorderRadius.circular(20.0),
                  )
                ])));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset(
            'assets/images/Line arrow-left.png'), // Adjust the path to your asset
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OldUserSignin()),
          );
        },
      ),
      // Rest of your AppBar properties...
    );
  }

  onTapTxtForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.password_change);
  }
}
