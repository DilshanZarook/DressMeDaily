import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.height,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.fontSize,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.margin,
    this.filled = true,
    this.validator,
    this.borderRadius,
    this.labelText,
    this.labelStyle,
    this.errorStyle,
    this.style,
    this.decoration, // Rename this if it's causing a conflict
  }) : super(key: key);

  final TextStyle? style;
  final InputDecoration? decoration;
  final Alignment? alignment;
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final double? fontSize;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final double? borderRadius;
  final EdgeInsets? margin;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Align(
        alignment: alignment ?? Alignment.center,
        child: textFormFieldWidget(context),
      ),
    );
  }

  Widget textFormFieldWidget(BuildContext context) => SizedBox(
        width: width ?? double.maxFinite,
        height: height,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode ?? FocusNode(),
          autofocus: autofocus ?? true,
          style: style,
          obscureText: obscureText ?? false,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          validator: validator,
          decoration: getInputDecoration(), // Use the renamed getter
        ),
      );

  InputDecoration getInputDecoration() {
    // Renamed getter
    return decoration ??
        InputDecoration(
          hintText: hintText ?? "",
          hintStyle: hintStyle,
          labelText: labelText,
          labelStyle: labelStyle,
          prefixIcon: prefix,
          prefixIconConstraints: prefixConstraints,
          suffixIcon: suffix,
          suffixIconConstraints: suffixConstraints,
          isDense: true,
          contentPadding: contentPadding ?? const EdgeInsets.all(8),
          fillColor: fillColor ?? theme.colorScheme.primary,
          filled: filled ?? true,
          border: borderDecoration ?? _defaultBorder(),
          enabledBorder: borderDecoration ?? _defaultBorder(),
          focusedBorder: borderDecoration ?? _defaultBorder(focus: true),
          errorBorder: borderDecoration ?? _defaultBorder(error: true),
          focusedErrorBorder:
              borderDecoration ?? _defaultBorder(focus: true, error: true),
          errorStyle: errorStyle,
        );
  }

  OutlineInputBorder _defaultBorder({bool focus = false, bool error = false}) {
    Color borderColor = focus
        ? theme.colorScheme.primary
        : error
            ? Colors.red
            : appTheme.black900;

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      borderSide: BorderSide(color: borderColor, width: 1),
    );
  }
}

extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get fillGray => OutlineInputBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            20.h,
          ),
        ),
        borderSide: BorderSide.none,
      );
}
