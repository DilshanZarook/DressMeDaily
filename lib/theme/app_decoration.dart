import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillDeepOrange => BoxDecoration(
    color: appTheme.deepOrange100,
  );

  static BoxDecoration get fillOnError => BoxDecoration(
    color: theme.colorScheme.onError.withOpacity(1),
  );
  static BoxDecoration get fillSecondaryContainer => BoxDecoration(
    color: theme.colorScheme.secondaryContainer,
  );
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray50,
  );
  static BoxDecoration get fillGray300 => BoxDecoration(
    color: appTheme.gray300,
  );
  // Gradient decorations
  static BoxDecoration get gradientBlueGrayDfToBlueGray => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.01, -0.13),
      end: Alignment(1, 0.98),
      colors: [
        appTheme.blueGray900Df,
        appTheme.blueGray900A4,
        appTheme.blueGray90000,
      ],
    ),
  );
  static BoxDecoration get gradientLimeToBlack => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(-0.04, 0.03),
      end: Alignment(0.96, 1),
      colors: [
        appTheme.lime40001,
        appTheme.lime40001.withOpacity(0.92),
        appTheme.black90000,
      ],
    ),
  );
  static BoxDecoration get gradientYellowAToBlack => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(-0.04, 0.03),
      end: Alignment(0.96, 1),
      colors: [
        appTheme.yellowA700,
        appTheme.lime90077,
        appTheme.black90000,
      ],
    ),
  );


  // Outline decorations
  static BoxDecoration get outlineOnError => BoxDecoration(
    border: Border.all(
      color: theme.colorScheme.onError.withOpacity(1),
      width: 30.h,
    ),
  );
  static BoxDecoration get outlinePrimary => BoxDecoration(
    color: appTheme.deepOrange50.withOpacity(0.64),
    boxShadow: [
      BoxShadow(
        color: theme.colorScheme.primary.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          2,
          5,
        ),
      ),
    ],
  );
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
    color: appTheme.deepOrange50,
    boxShadow: [
      BoxShadow(
        color: theme.colorScheme.primary.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          2,
          5,
        ),
      ),
    ],
  );
  static BoxDecoration get outlinePrimary2 => BoxDecoration();
  static BoxDecoration get outlinePrimary3 => BoxDecoration(
    color: appTheme.blueGray200,
    boxShadow: [
      BoxShadow(
        color: theme.colorScheme.primary.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          10,
        ),
      ),
    ],
  );
  static BoxDecoration get outlinePrimary4 => BoxDecoration();
  static BoxDecoration get outlinePrimary5 => BoxDecoration(
    border: Border.all(
      color: theme.colorScheme.primary.withOpacity(1),
      width: 1.h,
    ),
  );
  // Fill decorations

  static BoxDecoration get fillWhiteA => BoxDecoration(
    color: appTheme.black900,
  );
  // Define the fillErrorContainer decoration
  static BoxDecoration get fillErrorContainer => BoxDecoration(
    // Example definition, adjust according to your app's design requirements
    color: Colors.red, // Assuming 'errorContainer' is a red color
    border: Border.all(color: Colors.redAccent),
    borderRadius: BorderRadius.circular(8),
  );

  // Define the fillOnPrimary decoration
  static BoxDecoration get fillOnPrimary => BoxDecoration(
    // Example definition, adjust according to your app's design requirements
    color: Colors.blue, // Assuming 'onPrimary' refers to a primary color in your theme
    border: Border.all(color: Colors.blueAccent),
    borderRadius: BorderRadius.circular(8),
  );
  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
    color: appTheme.deepOrange50.withOpacity(0.64),
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          2,
          5,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineBlack900 => BoxDecoration(
    color: appTheme.deepOrange50,
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          2,
          5,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineBlack9001 => BoxDecoration();
  static BoxDecoration get outlineBlack9002 => BoxDecoration(
    color: appTheme.blueGray200,
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          10,
        ),
      ),
    ],
  );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder10 => BorderRadius.circular(
    10.h,
  );
  static BorderRadius get circleBorder17 => BorderRadius.circular(17);
  static BorderRadius get roundedBorder40 => BorderRadius.circular(40);
  static BorderRadius get roundedBorder50 => BorderRadius.circular(50);
  // Custom borders
  static BorderRadius get customBorderTL100 => BorderRadius.vertical(
    top: Radius.circular(100.h),
  );

  // Rounded borders
  static BorderRadius get roundedBorder100 => BorderRadius.circular(
    100.h,
  );
  static BorderRadius get roundedBorder15 => BorderRadius.circular(
    15.h,
  );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
    20.h,
  );

  // Rounded borders
  static BorderRadius get roundedBorder80 => BorderRadius.circular(
    80.h,
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
