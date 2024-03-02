import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Gender_selection/gender_selection.dart';
import 'package:sdgp_test01/presentation/Signup_new_user/signup_new_user.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Loading_page_1 extends StatefulWidget {
  const Loading_page_1({Key? key}) : super(key: key);
  @override
  _Loading_page_1State createState() => _Loading_page_1State();
}

class _Loading_page_1State extends State<Loading_page_1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Duration of one rotation cycle
      vsync: this,
    )..repeat(); // Repeat the animation

    _animation = Tween<double>(begin: 0, end: 2 * math.pi).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    Future.delayed(Duration(seconds: 3), () {
      _controller.dispose(); // Dispose the controller before navigating
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Signup_new_user()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center( // Center the image within the Stack
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // perspective
                ..rotateY(_animation.value), // rotation around Y-axis
              alignment: Alignment.center,
              child: SvgPicture.asset(
                ImageConstant.logo,
                height: 60.v,
                width: 60.h,
              ),
            ),
          ),
          Positioned(
            bottom: 50.v, // Position the text 400px up from the bottom of the screen
            left: 0,
            right: 0,
            child: Text(
              "STAY STICK WITH US.....",
              textAlign: TextAlign.center, // Ensure text is centered horizontally
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'BebasNeue',
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }






}
