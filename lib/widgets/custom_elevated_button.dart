import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'base_button.dart';

class CustomElevatedButton extends BaseButton {
  CustomElevatedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    EdgeInsets? margin,
    VoidCallback? onPressed,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    double? height,
    double? width,
    required String text,
    this.removeEffects = false, // Add this line
  }) : super(
    text: text,
    onPressed: onPressed,
    buttonStyle: buttonStyle,
    isDisabled: isDisabled,
    buttonTextStyle: buttonTextStyle,
    height: height,
    width: width,
    alignment: alignment,
    margin: margin,
  );

  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final bool removeEffects; // Add this line

  static ButtonStyle _noShadowStyle() {
    return ElevatedButton.styleFrom(
      elevation: 0, // Remove shadow
      primary: Colors.white, // Keep background color white
      // Add any other style adjustments here
    );
  }

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: buildElevatedButtonWidget,
    )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
    height: this.height ?? 27.v,
    width: this.width ?? double.maxFinite,
    margin: margin,
    decoration: decoration,
    child: ElevatedButton(
      style: removeEffects ? _noShadowStyle() : buttonStyle, // Use this line
      onPressed: isDisabled ?? false ? null : onPressed ?? () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leftIcon ?? const SizedBox.shrink(),
          Text(
            text,
            style: buttonTextStyle ?? CustomTextStyles.bodySmallGray500,
          ),
          rightIcon ?? const SizedBox.shrink(),
        ],
      ),
    ),
  );
}
