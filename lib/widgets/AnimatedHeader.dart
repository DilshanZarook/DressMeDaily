import 'package:flutter/material.dart';

class AnimatedHeader extends StatefulWidget {
  final String title;
  final Duration animationDuration;
  final double startOffset;
  final double endOffset;
  final Color backgroundColor; // Color parameter

  const AnimatedHeader({
    Key? key,
    required this.title,
    this.animationDuration = const Duration(milliseconds: 600),
    this.startOffset = -100.0,
    this.endOffset = 0.0,
    this.backgroundColor = Colors.green, // Default color
  }) : super(key: key);

  @override
  _AnimatedHeaderState createState() => _AnimatedHeaderState();
}

class _AnimatedHeaderState extends State<AnimatedHeader> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget.animationDuration,
      curve: Curves.easeOut,
      top: _isVisible ? widget.endOffset : widget.startOffset,
      left: 0,
      right: 0,
      child: Container(
        alignment: Alignment.center,
        height: 140,
        decoration: BoxDecoration(
          color: widget.backgroundColor, // Use the passed color
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
