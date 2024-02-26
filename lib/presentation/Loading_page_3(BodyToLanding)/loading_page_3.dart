import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/frame_312_screen/frame_312_screen.dart';

class Loading_page_3 extends StatefulWidget {
  const Loading_page_3({Key? key})
      : super(
    key: key,
  );
  @override
  _Loading_page_3State createState() => _Loading_page_3State();
}

class _Loading_page_3State extends State<Loading_page_3> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () {
      Navigator.pushReplacement( // Use pushReplacement to replace current screen
        context,
        MaterialPageRoute(builder: (context) => Frame312Screen()), // Navigate to Frame290Screen
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 188.v),
          child: Column(
            children: [
              Image.asset(
                ImageConstant.img02182611,
                height: 140.v,
                width: 120.h,
              ),
              SizedBox(height: 64.v),
              SizedBox(
                width: 250.h,
                height: 200.h,
                child: Text(
                  "Prepare for a stylish\n adventure\n as you step into the\n world of fashion...",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
