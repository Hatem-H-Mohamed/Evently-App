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
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColorCommon.primary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColorCommon.gray),
    ),
    contentPadding: const EdgeInsets.all(16),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    hintStyle: const TextStyle(fontSize: 18),
  ),
);
