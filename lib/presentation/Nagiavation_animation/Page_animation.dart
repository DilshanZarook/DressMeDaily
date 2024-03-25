import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class RadialRevealRoute extends PageRouteBuilder {
  final Widget page;
  final Rect origin;

  RadialRevealRoute({required this.page, required this.origin})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) => page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) {
      final size = MediaQuery.of(context).size;

      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          double left = origin.left - (origin.left * animation.value);
          double right = origin.right + ((size.width - origin.right) * animation.value);
          double top = origin.top - (origin.top * animation.value);
          double bottom = origin.bottom + ((size.height - origin.bottom) * animation.value);

          return ClipRect(
            clipper: RectangularRevealClipper(
              rect: Rect.fromLTRB(left, top, right, bottom),
            ),
            child: child,
          );
        },
        child: child,
      );
    },
  );
}

class RectangularRevealClipper extends CustomClipper<Rect> {
  final Rect rect;

  RectangularRevealClipper({required this.rect});

  @override
  Rect getClip(Size size) {
    return rect;
  }

  @override
  bool shouldReclip(RectangularRevealClipper oldClipper) {
    return oldClipper.rect != rect;
  }
}
