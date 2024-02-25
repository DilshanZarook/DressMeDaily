import 'package:flutter/material.dart';

void main() {
  runApp(const BodySelection());
}

class BodySelection extends StatelessWidget {
  const BodySelection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 120.0),
              child: Text(
                'Select a body type',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 160.0),
                  child: CustomButton(
                      imagePath: 'images/type1.jpg',
                      text: 'S',
                      onPressed: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 110.0),
                  child: CustomButton(
                      imagePath: 'images/type2.jpg',
                      text: 'M',
                      onPressed: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: CustomButton(
                      imagePath: 'images/type3.jpg',
                      text: 'L',
                      onPressed: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 110.0),
                  child: CustomButton(
                      imagePath: 'images/type4.jpg',
                      text: 'XL',
                      onPressed: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 160.0),
                  child: CustomButton(
                      imagePath: 'images/type5.jpeg',
                      text: 'XXL+',
                      onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;

  const CustomButton(
      {required this.imagePath,
      required this.text,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagePath, width: 50.0, height: 160.0, fit: BoxFit.cover),
        const SizedBox(height: 8.0), // Add spacing between image and text
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey, // Change the background color here
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
