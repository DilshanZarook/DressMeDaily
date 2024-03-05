import 'package:flutter/material.dart';
import '../Body_selection_male/body_selection_male.dart';
import '../Body_selection_female/body_selection_female.dart';




class Gender_selection extends StatefulWidget {
  const Gender_selection({Key? key}) : super(key: key);

  @override
  _Gender_selectionState createState() => _Gender_selectionState();
}



class _Gender_selectionState extends State<Gender_selection> with TickerProviderStateMixin {
  late AnimationController _animationControllerYellow;
  late AnimationController _animationControllerRed;
  late Animation<Offset> _animationYellow;
  late Animation<Offset> _animationRed;
  final double _rectangleWidth = 150;
  final double _rectangleHeight = 80;
  final double _horizontalSpacing = 20; // Spacing between left and right rectangles

  @override
  void initState() {
    super.initState();
    _animationControllerYellow = AnimationController(
      duration: const Duration(milliseconds: 25),
      vsync: this,
    );
    _animationControllerRed = AnimationController(
      duration: const Duration(milliseconds: 25),
      vsync: this,
    );
    _animationYellow = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.0, 1.0),
    ).animate(_animationControllerYellow);
    _animationRed = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.0, 1.0),
    ).animate(_animationControllerRed);
  }

  @override
  void dispose() {
    _animationControllerYellow.dispose();
    _animationControllerRed.dispose();
    super.dispose();
  }

  void _startAnimation(AnimationController controller) {
    controller.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 25), () {
        controller.reverse();
      });
    });
  }


  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset('assets/images/Line arrow-left.png'), // Replace with your actual arrow image asset path
        onPressed: () {
          Navigator.of(context).pop();
        },
      ), // Replace with your screen's title
      // You can add more AppBar properties if needed
    );
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the left position for the second set of rectangles
    double secondColumnLeftPosition = _rectangleWidth + _horizontalSpacing + 30 + 30;

    return MaterialApp(

      home: Scaffold(
        appBar: _buildAppBar(context),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 200),
                Text(
                  "You are a ?", // Added text
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 200),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      // Original blue rectangle
                      Positioned(
                        top: 35,
                        left: 80,
                        child: Container(
                          width: _rectangleWidth,
                          height: _rectangleHeight,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(40), border: Border.all(
                            color: Colors.black, // Color of the border
                            width: 3.0, // Width of the border
                          ),
                          ),
                        ),
                      ),
                      // Original yellow animated rectangle
                      _buildAnimatedRectangle(Colors.white, 20, 65, _animationYellow, _animationControllerYellow, 'Boy'),
                      // New green rectangle (duplicate)
                      Positioned(
                        top: 35,
                        left: 280,
                        child: Container(
                          width: _rectangleWidth,
                          height: _rectangleHeight,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(40), border: Border.all(
                            color: Colors.black, // Color of the border
                            width: 3.0, // Width of the border
                          ),
                          ),
                        ),
                      ),
                      // New red animated rectangle (duplicate)
                      _buildAnimatedRectangle(Colors.white, 20, 265, _animationRed, _animationControllerRed, 'Girl'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedRectangle(
      Color color,
      double top,
      double left,
      Animation<Offset> animation,
      AnimationController controller,
      String label,
      ) {
    ValueNotifier<bool> isHovered = ValueNotifier(false);
    ValueNotifier<bool> isClicked = ValueNotifier(false);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Positioned(
          top: top + 15 * animation.value.dy,
          left: left + 15 * animation.value.dx,
          child: MouseRegion(
            onEnter: (event) => isHovered.value = true,
            onExit: (event) => isHovered.value = false,
            child: ValueListenableBuilder(
              valueListenable: isHovered,
              builder: (context, bool isHover, _) {
                return ValueListenableBuilder(
                  valueListenable: isClicked,
                  builder: (context, bool isClick, _) {
                    return GestureDetector(
                      onTap: () {
                        isClicked.value = true; // Set to true when tapped
                        _startAnimation(controller);
                        Future.delayed(const Duration(milliseconds: 400), () {
                          isClicked.value = false; // Reset to false after action
                          if (label == 'Boy') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Body_selection_male()),
                            );
                          } else if (label == 'Girl') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Bodyselectionfemale()),
                            );
                          }
                        });
                      },
                      onTapDown: (_) => isClicked.value = true, // Optional: If you want immediate feedback
                      onTapCancel: () => isClicked.value = false, // Optional: If the tap doesn't complete
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300), // Duration for color change animation
                        curve: Curves.easeInOut, // Animation curve for color change
                        width: _rectangleWidth,
                        height: _rectangleHeight,
                        decoration: BoxDecoration(
                          color: isClicked.value ? Colors.greenAccent[400] : color, // Change color on click
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: Colors.black, // Color of the border
                            width: 3.0, // Width of the border
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          label,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    );

                  },
                );
              },
            ),
          ),
        );
      },
    );
  }



}
