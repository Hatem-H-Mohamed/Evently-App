import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:evently_app/core/app_theme/theme/elevated_button_them.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getLightTheme() => ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColorCommon.primary,
  scaffoldBackgroundColor: AppColorLight.background,

  textTheme: GoogleFonts.interTextTheme().apply(
    bodyColor: AppColorLight.textBodyColor,
  ),
  elevatedButtonTheme: getElevatedButtonTheme(),
);
