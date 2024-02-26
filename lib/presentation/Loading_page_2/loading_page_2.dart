import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Gender_selection/gender_selection.dart';
import 'package:sdgp_test01/presentation/frame_293_screen/frame_293_screen.dart';
import 'package:sdgp_test01/presentation/Loading_page_2/loading_page_2.dart'; // Make sure the path is correct

class Loading_page_2 extends StatefulWidget {
  const Loading_page_2({Key? key}) : super(key: key);

  @override
  _Loading_page_2State createState() => _Loading_page_2State();
}

class _Loading_page_2State extends State<Loading_page_2> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      Navigator.pushReplacement( // Use pushReplacement to replace current screen
        context,
        MaterialPageRoute(builder: (context) => Gender_selection()), // Navigate to Frame290Screen
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
