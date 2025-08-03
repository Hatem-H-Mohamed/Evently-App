import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_dark.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:evently_app/core/app_theme/theme/elevated_button_them.dart';
import 'package:evently_app/core/app_theme/theme/text_selection_them.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getDarkTheme() => ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColorCommon.primary,
  scaffoldBackgroundColor: AppColorDark.background,
  textTheme: GoogleFonts.interTextTheme().apply(
    bodyColor: AppColorDark.textBodyColor,
  ),
  elevatedButtonTheme: getElevatedButtonTheme(),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColorCommon.gray),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColorCommon.primary),
    ),
    contentPadding: const EdgeInsets.all(16),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    hintStyle: const TextStyle(fontSize: 18),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    elevation: 0,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColorLight.background,
    unselectedItemColor: AppColorLight.background,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12.sp,
    ),
  ),

  bottomAppBarTheme: BottomAppBarTheme(
    color: AppColorDark.background,
    shape: CircularNotchedRectangle(),
    padding: EdgeInsets.all(0),
    height: 65.h,
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColorDark.background,
    foregroundColor: AppColorLight.background,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(56.r),
      side: BorderSide(color: AppColorLight.background, width: 4.w),
    ),
  ),
  textSelectionTheme: getTextSelectionTheme(),
);
