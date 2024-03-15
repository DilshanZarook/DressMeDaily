import 'package:flutter/material.dart';
import '../Body_selection_male/body_selection_male.dart';
import '../Body_selection_female/body_selection_female.dart';

class Gender_selection extends StatefulWidget {
  const Gender_selection({Key? key}) : super(key: key);

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<Gender_selection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/Line arrow-left.png'), // Verify this asset path is correct
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // title: Text('Gender Selection'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // color: const Color.fromARGB(255, 0, 0, 0),
                child: Text(
                  "You are a ?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0)), // Change text color to white for better contrast
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150, // Set explicit width
                    height: 100, // Set explicit height
                    child: genderSelectionButton('Boy', Color(0xFF474747), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Body_selection_male()),
                      );
                    }),
                  ),
                  SizedBox(
                    width: 150, // Set explicit width
                    height: 100, // Set explicit height
                    child: genderSelectionButton('Girl', Color(0xFF474747), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Bodyselectionfemale()),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
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
}