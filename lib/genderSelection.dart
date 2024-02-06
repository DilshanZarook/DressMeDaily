import 'package:flutter/material.dart';

class GenderSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gender Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle male selection
              },
              child: Text('MALE'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle female selection
              },
              child: Text('FEMALE'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle other gender selection
              },
              child: Text('OTHER'),
            ),
          ],
        ),
      ),
    );
  }
}
