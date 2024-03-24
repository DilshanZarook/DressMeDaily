import 'package:flutter/material.dart';
import '../core/app_export.dart';  // Ensure this import is correct and necessary
import 'base_button.dart';  // Ensure this import is correct and necessary

class CustomElevatedButton extends BaseButton {
  const CustomElevatedButton({
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
    this.removeEffects = false,
  }) : super(
    key: key,  // Added key to super constructor
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
  final bool removeEffects;

  static ButtonStyle _noShadowStyle() {
    return ElevatedButton.styleFrom(
      elevation: 0, backgroundColor: Colors.white,
      // Add any other style adjustments here
    );
  }

  @override
  Widget build(BuildContext context) {
    // Simplified alignment check using null-coalescing operator
    return Align(
      alignment: alignment ?? Alignment.center,
      child: buildElevatedButtonWidget,
    );
  }

  Widget get buildElevatedButtonWidget => Container(
    height: height ?? 27.v,
    width: width ?? double.maxFinite,
    margin: margin,
    decoration: decoration,
    child: ElevatedButton(
      style: removeEffects ? _noShadowStyle() : buttonStyle ?? ElevatedButton.styleFrom(),
      onPressed: isDisabled ?? false ? null : onPressed ?? () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leftIcon ?? const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8), // For spacing between text and icons
            child: Text(
              text,
              style: buttonTextStyle ?? CustomTextStyles.bodySmallGray500,
            ),
          ),
          rightIcon ?? const SizedBox.shrink(),
        ],
      ),
    ),
  );
}
