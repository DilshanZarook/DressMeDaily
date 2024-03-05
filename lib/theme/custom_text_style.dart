import 'package:flutter/material.dart';
import '../core/app_export.dart';


/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge16 => theme.textTheme.bodyLarge!.copyWith(
    fontSize: 16.fSize,
  );
  static get bodyLargeGray50001 => theme.textTheme.bodyLarge!.copyWith(
    color: appTheme.gray50001,
  );
  static get bodyLargeGray80002 => theme.textTheme.bodyLarge!.copyWith(
    color: appTheme.gray80002,
    fontSize: 16.fSize,
  );
  static get bodyLargeOnError => theme.textTheme.bodyLarge!.copyWith(
    color: theme.colorScheme.onError.withOpacity(1),
    fontSize: 16.fSize,
  );
  static get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray500,
  );
  static get bodyMediumGray60001 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray60001,
  );
  static get bodyMediumGray60003 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray60003,
    fontSize: 15.fSize,
  );
  static get bodyMediumGray700 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray700,
  );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
    color: theme.colorScheme.primary,
  );
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.black900,
    fontSize: 12.fSize,
  );
  static get bodySmallGray70001 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray70001,
  );
  static get bodyMediumGray70002 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray70002,
  );

  static get bodySmall10 => theme.textTheme.bodySmall!.copyWith(
    fontSize: 10.fSize,
  );

  static get bodySmallGray400 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray400,
    fontSize: 10.fSize,
  );
  static get bodySmallGray40002 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray40002,
    fontSize: 10.fSize,
  );
  static get bodySmallGray500 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray500,
  );
  static get bodySmallGray700 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray700,
    fontSize: 10.fSize,
  );
  static get bodySmallGray70003 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray70003,
  );
  static get bodySmallGray70004 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray70004,
  );
  static get bodySmallGray70005 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray70005,
    fontSize: 10.fSize,
  );
  static get bodySmallGray80002 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray80002,
  );
  static get bodySmallOnError => theme.textTheme.bodySmall!.copyWith(
    color: theme.colorScheme.onError.withOpacity(1),
  );
  // Headline text style
  static get headlineSmallGray70001 => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.gray70001,
  );
  static get headlineSmallGray80002 => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.gray80002,
  );
  static get headlineSmallMedium => theme.textTheme.headlineSmall!.copyWith(
    fontWeight: FontWeight.w500,
  );
  static get headlineSmallMedium25 => theme.textTheme.headlineSmall!.copyWith(
    fontSize: 25.fSize,
    fontWeight: FontWeight.w500,
  );
  static get headlineSmallOnError => theme.textTheme.headlineSmall!.copyWith(
    color: theme.colorScheme.onError.withOpacity(1),
  );
  // Title text style
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
    color: theme.colorScheme.primary.withOpacity(1),
  );
  static get titleMedium16 => theme.textTheme.titleMedium!.copyWith(
    fontSize: 16.fSize,
  );
  static get titleMediumGray600 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.gray600,
  );
  // Title text style
  static get titleLargeGray70002 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.gray70002,
  );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.black900,
  );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
