import 'package:sdgp_test01/core/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {

  // Filled button style
  static ButtonStyle get fillGrayTL20 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.gray50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.h),
    ),
  );
  // Gradient button style
  static BoxDecoration get gradientAmberToWhiteADecoration => BoxDecoration(
    borderRadius: BorderRadius.circular(29.h),
    boxShadow: [
      BoxShadow(
        color: theme.colorScheme.secondaryContainer,
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: const Offset(
          0,
          4,
        ),
      ),
    ],
    gradient: LinearGradient(
      begin: const Alignment(-0.03, 0),
      end: const Alignment(1.0, 1),
      colors: [
        appTheme.amber400,
        appTheme.whiteA70000,
      ],
    ),
  );
  static BoxDecoration get gradientBlueGrayDfToBlueGrayDecoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(30.h),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.secondaryContainer,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
        gradient: LinearGradient(
          begin: const Alignment(-0.17, 0),
          end: const Alignment(1.01, 0),
          colors: [
            appTheme.blueGray900Df,
            appTheme.blueGray90000,
          ],
        ),
      );
  static BoxDecoration get gradientLimeToBlackDecoration => BoxDecoration(
    borderRadius: BorderRadius.circular(28.h),
    boxShadow: [
      BoxShadow(
        color: theme.colorScheme.secondaryContainer,
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: const Offset(
          0,
          4,
        ),
      ),
    ],
    gradient: LinearGradient(
      begin: const Alignment(-0.04, 0),
      end: const Alignment(0.96, 1),
      colors: [
        appTheme.lime40001,
        appTheme.black90000,
      ],
    ),
  );
  // text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    elevation: MaterialStateProperty.all<double>(0),
  );
  // Outline button style
  static ButtonStyle get outlineBlack => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: appTheme.black900,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(31.h),
        ),
      );
  static ButtonStyle get outlineBlackTL101 => OutlinedButton.styleFrom(
        backgroundColor: appTheme.blueGray100,
        side: BorderSide(
          color: appTheme.black900,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
      );
  static ButtonStyle get outlineBlackTL102 => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: appTheme.black900,
          width: 3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
      );
  static ButtonStyle get outlineBlackTL103 => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: appTheme.black900,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
      );
  static ButtonStyle get outlineBlackTL20 => OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        side: BorderSide(
          color: appTheme.black900,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.h),
        ),
      );
  // text button style

}
