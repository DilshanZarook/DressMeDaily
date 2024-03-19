import 'package:flutter/material.dart';
import 'package:DressMeDaily/core/app_export.dart';

// ignore_for_file: must_be_immutable
class Thank_popup extends StatelessWidget {
  final VoidCallback? onClose;

  const Thank_popup({Key? key, this.onClose}) : super(key: key);

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
    Navigator.pushNamed(context, 'subscription_page_confirmation'); // Add this line
  }
}
