import 'package:flutter/material.dart';

import 'colors.dart';

class Styles {
//font sizes for theme
  static const _fontExLarge = 22.0;
  static const _fontLarge = 17.0;
  static const _fontNormal = 15.0;
  static const _fontSmall = 12.0;

//font line heights
  static const _lineHeight32 = 32.0;
  static const _lineHeight27 = 27.0;
  static const _lineHeight25 = 25.0;
  static const _lineHeight15 = 15.0;

  static const headerLarge = TextStyle(
      fontSize: _fontExLarge,
      fontWeight: FontWeight.w700,
      color: AppColors.mainText,
      height: _lineHeight32);

  static const headerNormal = TextStyle(
      fontSize: _fontLarge,
      fontWeight: FontWeight.w700,
      color: AppColors.mainText,
      height: _lineHeight27);

  static const headerSmall = TextStyle(
      fontSize: _fontNormal,
      fontWeight: FontWeight.w700,
      color: AppColors.mainText,
      height: _lineHeight25);

  static const bodyLagre = TextStyle(
      fontSize: _fontLarge,
      fontWeight: FontWeight.w500,
      color: AppColors.mainText,
      height: _lineHeight27);

  static const bodyNormal = TextStyle(
      fontSize: _fontNormal,
      fontWeight: FontWeight.w500,
      color: AppColors.mainText,
      height: _lineHeight25);

  static const bodySmall = TextStyle(
      fontSize: _fontSmall,
      fontWeight: FontWeight.w500,
      color: AppColors.mainText,
      height: _lineHeight15);
}
