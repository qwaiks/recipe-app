import 'package:chefio/config/colors.dart';
import 'package:chefio/config/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final defaultTheme = ThemeData(
      primaryColor: AppColors.primary,
      textTheme: GoogleFonts.interTextTheme().copyWith(
        bodyText1: Styles.bodyNormal,
      ));
}
