import 'package:flutter/material.dart';
import '../Body_selection_male/body_selection_male.dart';
import '../Body_selection_female/body_selection_female.dart';

class Gender_selection extends StatefulWidget {
  const Gender_selection({Key? key}) : super(key: key);

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<Gender_selection> {
  Color boyButtonColor = Color(0xFF474747); // Initial color for 'Boy' button
  Color girlButtonColor = Color(0xFF474747); // Initial color for 'Girl' button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/Line arrow-left.png'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "You are a ?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150, // Set explicit width
                  height: 100, // Set explicit height
                  child: genderSelectionButton('Boy', boyButtonColor, () {
                    selectGender('Boy');
                  }),
                ),
                SizedBox(
                  width: 150, // Set explicit width
                  height: 100, // Set explicit height
                  child: genderSelectionButton('Girl', girlButtonColor, () {
                    selectGender('Girl');
                  }),
                ),
              ],
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget genderSelectionButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Color(0xFF6BFF09), backgroundColor: color, // Text color
          shape: StadiumBorder(), // Rounded edges
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18), // Padding inside the button
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ));
  }
  void selectGender(String gender) {
    Color selectedColor = Colors.green; // Color for selection effect
    Color defaultColor = Color(0xFF474747); // Default button color

    setState(() {
      if (gender == 'Boy') {
        boyButtonColor = selectedColor;
      } else {
        girlButtonColor = selectedColor;
      }
    });

    // Delay for the color change effect
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        // Reset the button colors
        boyButtonColor = defaultColor;
        girlButtonColor = defaultColor;
      });

      // Delay for navigation
      Future.delayed(Duration(milliseconds: 100), () {
        if (gender == 'Boy') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Body_selection_male()));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Bodyselectionfemale()));
        }
      });
    });
  }
}