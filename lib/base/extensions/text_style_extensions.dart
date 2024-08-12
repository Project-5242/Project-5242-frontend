import 'package:flutter/material.dart';
import '../utils/app_utils.dart';

extension TextStyleExtensions on BuildContext {
  /// Display Large
  TextStyle get displayLarge => _baseTextStyle(57.0, FontWeight.w300);

  /// Display Medium
  TextStyle get displayMedium => _baseTextStyle(45.0, FontWeight.w400);

  /// Display Small
  TextStyle get displaySmall => _baseTextStyle(36.0, FontWeight.w500);

  /// Headline Large
  TextStyle get headlineLarge => _baseTextStyle(32.0, FontWeight.w300);

  /// Headline Medium
  TextStyle get headlineMedium => _baseTextStyle(28.0, FontWeight.w400);

  /// Headline Small
  TextStyle get headlineSmall => _baseTextStyle(24.0, FontWeight.w500);

  /// Title Large
  TextStyle get titleLarge => _baseTextStyle(22.0, FontWeight.w600);

  /// Title Medium
  TextStyle get titleMedium => _baseTextStyle(16.0, FontWeight.w600);

  /// Title Small
  TextStyle get titleSmall => _baseTextStyle(14.0, FontWeight.w500);

  /// Body Large
  TextStyle get bodyLarge => _baseTextStyle(16.0, FontWeight.w400);

  /// Body Medium
  TextStyle get bodyMedium => _baseTextStyle(14.0, FontWeight.w400);

  /// Body Small
  TextStyle get bodySmall => _baseTextStyle(12.0, FontWeight.w400);

  /// Label Large
  TextStyle get labelLarge => _baseTextStyle(14.0, FontWeight.w500);

  /// Label Medium
  TextStyle get labelMedium => _baseTextStyle(12.0, FontWeight.w500);

  /// Label Small
  TextStyle get labelSmall => _baseTextStyle(11.0, FontWeight.w500);

  /// Custom font with color
  TextStyle customFont(
    String fontFamily,
    double fontSize,
    FontWeight fontWeight,
    Color color,
  ) {
    return TextStyle(
      fontSize: AppUtils.getAdaptiveFontSize(this, fontSize),
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      color: color,
    );
  }

  /// Text style with decoration
  TextStyle withDecoration(
    double fontSize,
    FontWeight fontWeight,
    TextDecoration decoration,
  ) {
    return TextStyle(
      fontSize: AppUtils.getAdaptiveFontSize(this, fontSize),
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  /// Text style with shadows
  TextStyle withShadow(
    double fontSize,
    FontWeight fontWeight,
    Color shadowColor,
    double shadowBlurRadius,
  ) {
    return TextStyle(
      fontSize: AppUtils.getAdaptiveFontSize(this, fontSize),
      fontWeight: fontWeight,
      shadows: [
        Shadow(
          color: shadowColor,
          blurRadius: shadowBlurRadius,
        ),
      ],
    );
  }

  /// Text style with letter spacing
  TextStyle withLetterSpacing(
    double fontSize,
    FontWeight fontWeight,
    double letterSpacing,
  ) {
    return TextStyle(
      fontSize: AppUtils.getAdaptiveFontSize(this, fontSize),
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }

  /// Base text style with custom font weight
  TextStyle _baseTextStyle(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: AppUtils.getAdaptiveFontSize(this, fontSize),
      fontWeight: fontWeight,
    );
  }
}
