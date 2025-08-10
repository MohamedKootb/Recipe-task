import 'package:flutter/material.dart';

import '../theming/app_sizer.dart';
import '../theming/text_styles.dart';

TextStyle appTextStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? height,
}) {
  return TextStyle(
    height: height,
    fontStyle: fontStyle,
    decoration: decoration,
    fontWeight: fontWeight,
    fontFamily: FontConstants.fontFamily,
    wordSpacing: wordSpacing,
    fontSize: fontSize != null ? fontSize.sp : 16.sp,
    letterSpacing: letterSpacing,
    decorationColor: decorationColor,
    decorationStyle: decorationStyle,
    color: color,
  );
}
