import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Signup_new_user/signup_new_user.dart';
import 'package:sdgp_test01/presentation/Loading_page_1/loading_page_1.dart'; // Make sure the path is correct

class Loading_page_1 extends StatefulWidget {
  const Loading_page_1({Key? key}) : super(key: key);

  @override
  _Loading_page_1State createState() => _Loading_page_1State();
}

class _Loading_page_1State extends State<Loading_page_1> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      Navigator.pushReplacement( // Use pushReplacement to replace current screen
        context,
        MaterialPageRoute(builder: (context) => Signup_new_user()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 1.v),
              CustomImageView(
                imagePath: ImageConstant.img02182611,
                height: 255.v,
                width: 229.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
