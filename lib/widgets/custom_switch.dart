import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../core/app_export.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch({
    Key? key,
    required this.onChange,
    this.alignment,
    this.value,
    this.width,
    this.height,
    this.margin,
  }) : super(key: key);

  final Alignment? alignment;
  final bool? value;
  final Function(bool) onChange;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange(!(value ?? false));
      },
      child: Container(
        height: height,
        width: width,
        margin: margin,
        child: alignment != null
            ? Align(
          alignment: alignment ?? Alignment.center,
          child: switchWidget,
        )
            : switchWidget,
      ),
    );
  }

  Widget get switchWidget => CupertinoSwitch(
    value: value ?? false,
    onChanged: (newValue) {
      // Note: This onChanged is necessary for the switch to be dragged.
      // It updates the value when the switch is dragged.
      onChange(newValue);
    },
  );
}
