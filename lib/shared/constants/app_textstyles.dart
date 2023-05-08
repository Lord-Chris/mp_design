import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static const dmSans = "DM Sans";

  static TextStyle dynamic(
    double size, {
    Color? color,
    FontWeight? weight,
    double? height,
    double? spacing,
    FontStyle? style,
    String? fontFamily,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? dmSans,
      fontSize: size.spMin,
      color: color,
      fontWeight: weight,
      height: height == null ? null : height / size,
      letterSpacing: spacing,
      fontStyle: style,
    );
  }

  // Regular
  /// Default color - Lightcolor2
  static final regular11 = TextStyle(
    fontSize: 11.spMin,
    fontWeight: FontWeight.normal,
    height: 1.3,
  );

  /// Default color - Lightcolor2
  static final regular12 = TextStyle(
    fontSize: 12.spMin,
    fontWeight: FontWeight.normal,
    height: 1.2,
  );

  /// Default color - Lightcolor2
  static final regular13 = TextStyle(
    fontSize: 13.spMin,
    fontWeight: FontWeight.normal,
    height: 1.3,
  );

  /// Default color - Lightcolor2
  static final regular14 = TextStyle(
    fontSize: 14.spMin,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );

  /// Default color - Lightcolor2
  static final regular16 = TextStyle(
    fontSize: 16.spMin,
    fontWeight: FontWeight.normal,
  );

  // Medium
  /// Default color - DeepBlue2
  static final medium12 = TextStyle(
    fontSize: 12.spMin,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  static final medium13 = TextStyle(
    fontSize: 13.spMin,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  /// Default color - DarkColor1
  static final medium14 = TextStyle(
    fontSize: 14.spMin,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  /// Default color - DarkColor1
  static final medium16 = TextStyle(
    fontSize: 16.spMin,
    fontWeight: FontWeight.w500,
  );

  /// Default color - DarkColor1
  static final medium18 = TextStyle(
    fontSize: 18.spMin,
    fontWeight: FontWeight.w500,
  );

  /// Default color - DarkColor1
  static final medium24 = TextStyle(
    fontSize: 24.spMin,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  /// Default color - DarkColor1
  static final medium26 = TextStyle(
    fontSize: 26.spMin,
    fontWeight: FontWeight.w500,
  );

  /// Default color - DarkColor1
  static final medium28 = TextStyle(
    fontSize: 28.spMin,
    fontWeight: FontWeight.w500,
  );

  /// Default color - DarkColor1
  static final medium30 = TextStyle(
    fontSize: 30.spMin,
    fontWeight: FontWeight.w500,
  );

  // Bold
  static final bold12 = TextStyle(
    fontSize: 12.spMin,
    fontWeight: FontWeight.bold,
  );

  static final bold14 = TextStyle(
    fontSize: 14.spMin,
    fontWeight: FontWeight.bold,
  );

  static final bold16 = TextStyle(
    fontSize: 16.spMin,
    fontWeight: FontWeight.bold,
  );

  // Default Color -
  static final bold18 = TextStyle(
    fontSize: 18.spMin,
    fontWeight: FontWeight.bold,
  );

  static final bold20 = TextStyle(
    fontSize: 20.spMin,
    fontWeight: FontWeight.bold,
  );

  static final bold28 = TextStyle(
    fontSize: 28.spMin,
    fontWeight: FontWeight.bold,
  );

  static final bold40 = TextStyle(
    fontSize: 40.spMin,
    fontWeight: FontWeight.bold,
  );
}
