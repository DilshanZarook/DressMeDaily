import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:DressMeDaily/core/app_export.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SpinningLogo extends StatefulWidget {
  const SpinningLogo({Key? key}) : super(key: key);

  @override
  _SpinningLogoState createState() => _SpinningLogoState();
}

class _SpinningLogoState extends State<SpinningLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 2 * math.pi).animate(_controller)
      ..addListener(() {
        setState(() {});
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
        ],
      ),
    );
  }






}
