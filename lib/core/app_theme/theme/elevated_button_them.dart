import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ElevatedButtonThemeData getElevatedButtonTheme() => ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColorCommon.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    foregroundColor: AppColorLight.background,
    minimumSize: Size(double.infinity, 56.h),
  ),
);
