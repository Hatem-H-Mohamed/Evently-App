import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_dark.dart';
import 'package:evently_app/core/app_theme/theme/elevated_button_them.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getDarkTheme() => ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColorCommon.primary,
  scaffoldBackgroundColor: AppColorDark.background,
  textTheme: GoogleFonts.interTextTheme().apply(
    bodyColor: AppColorDark.textBodyColor,
  ),
  elevatedButtonTheme: getElevatedButtonTheme(),
);
