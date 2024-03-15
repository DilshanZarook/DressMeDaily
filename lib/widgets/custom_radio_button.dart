import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomRadioButton extends StatelessWidget {
  CustomRadioButton({
    Key? key,
    required this.onChange,
    this.decoration,
    this.alignment,
    this.isRightCheck,
    this.iconSize,
    this.value,
    this.groupValue,
    this.text,
    this.width,
    this.padding,
    this.textStyle,
    this.textAlignment,
    this.gradient,
    this.backgroundColor,
  }) : super(
          key: key,
        );

  final BoxDecoration? decoration;

  final Alignment? alignment;

  final bool? isRightCheck;

  final double? iconSize;

  String? value;

  final String? groupValue;

  final Function(String) onChange;

  final String? text;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final TextStyle? textStyle;

  final TextAlign? textAlignment;

  final Gradient? gradient;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text ?? "",
              textAlign: textAlignment ?? TextAlign.start,
              style: textStyle ?? CustomTextStyles.bodyLarge16,
            ),
          ),
          const SizedBox(width: 200), // 200px distance
          GestureDetector(
            onTap: () => onChange(value ?? ""),
            child: Radio<String>(
              value: value ?? "",
              groupValue: groupValue,
              onChanged: (String? newValue) {
                if (newValue != null) onChange(newValue);
              },
            ),
          ),
        ],
      ),
    );
  }

  bool get isGradient => gradient != null;
  BoxDecoration get gradientDecoration => BoxDecoration(gradient: gradient);
  Widget get buildRadioButtonWidget => InkWell(
        onTap: () {
          onChange(value!);
        },
        child: Container(
          decoration: decoration,
          width: width,
          padding: padding,
          child: (isRightCheck ?? false)
              ? rightSideRadioButton
              : leftSideRadioButton,
        ),
      );
  Widget get leftSideRadioButton => Row(
    children: [
      GestureDetector(
        onTap: () => onChange(value ?? ""),
        child: radioButtonWidget,
      ),
      textWidget,
    ],
  );

  Widget get rightSideRadioButton => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      textWidget,
      GestureDetector(
        onTap: () => onChange(value ?? ""),
        child: radioButtonWidget,
      ),
    ],
  );
  Widget get textWidget => Text(
        text ?? "",
        textAlign: textAlignment ?? TextAlign.center,
        style: textStyle ?? CustomTextStyles.bodyLarge16,
      );
  Widget get radioButtonWidget => Container(
    height: iconSize ?? 15.h,
    width: iconSize ?? 15.h,
    decoration: radioButtonDecoration,
    child: Radio<String>(
      value: value ?? "",
      groupValue: groupValue,
      onChanged: (value) {
        onChange(value!);
      },
      activeColor: Colors.black, // Set active color to black
    ),
  );
  BoxDecoration get radioButtonDecoration =>
      BoxDecoration(color: backgroundColor);
}
