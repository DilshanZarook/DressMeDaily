import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/presentation/Starting_page/starting_page.dart';

class Loading_page_4 extends StatefulWidget {
 const Loading_page_4({Key? key}) : super(key: key);
 @override
 _Loading_page_4State createState() => _Loading_page_4State();
}

class _Loading_page_4State extends State<Loading_page_4> with SingleTickerProviderStateMixin {
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

    Future.delayed(const Duration(seconds: 3), () {
      // Do not dispose of the controller here
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Starting_page()),
      );
    });
 }

 @override
 void dispose() {
    _controller.dispose(); // Dispose of the controller here
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
            child: const Text(
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
