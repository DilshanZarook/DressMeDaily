import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';

class Frame647Dialog extends StatelessWidget {
  const Frame647Dialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapFrame(context);
        },
        child: Container(
            width: 188.h,
            padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 13.v),
            decoration: AppDecoration.fillGray
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text("Thanks for your purchase !",
                  style: theme.textTheme.bodySmall),
              SizedBox(height: 43.v),
              Text("click to proceed..", style: CustomTextStyles.bodySmall10),
              SizedBox(height: 10.v)
            ])));
  }

  /// Navigates to the frame650Screen when the action is triggered.
  onTapFrame(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.frame_650_screen);
  }
}
