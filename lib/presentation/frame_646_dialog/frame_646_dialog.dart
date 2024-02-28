import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/frame_640_screen/frame_640_screen.dart';

class Frame646Dialog extends StatelessWidget {
  const Frame646Dialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 188.h,
      padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 13.v),
      decoration: AppDecoration.fillGray
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          "Are you sure, you want to cancel ? ",
          style: TextStyle(fontSize: 20.0), // Change the font size here
        ),
        SizedBox(height: 43.v),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'No',
                style: TextStyle(fontSize: 16.0,color: Colors.black), // Change the font size here
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Frame640Screen()),
              ),
              child: Text(
                'Yes',
                style: TextStyle(fontSize: 16.0,color: Colors.black), // Change the font size here
              ),
            ),
          ],
        ),
        SizedBox(height: 10.v)
      ]),
    );
  }
}
