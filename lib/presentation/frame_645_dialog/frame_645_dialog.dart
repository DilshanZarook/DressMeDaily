import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';

// ignore_for_file: must_be_immutable
class Frame645Dialog extends StatelessWidget {
  final VoidCallback? onClose;

  const Frame645Dialog({Key? key, this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.h,
      padding: EdgeInsets.symmetric(
        horizontal: 18.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 0.v),
          Text(
            "Thanks for your purchase !",
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
  void closeDialog(BuildContext context) {
    if (onClose != null) {
      onClose!();
    }
    Navigator.pop(context);
    Navigator.pushNamed(context, 'Frame680'); // Add this line
  }
}
