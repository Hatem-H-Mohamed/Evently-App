import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            SearchBar(
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  side: BorderSide(color: AppColorCommon.primary, width: 1.r),
                ),
              ),
              backgroundColor: WidgetStateProperty.all(
                AppColorLight.background,
              ),
              elevation: WidgetStateProperty.all(0),
              hintText: 'Search for events',
              leading: Icon(Icons.search, color: AppColorCommon.primary),
              hintStyle: WidgetStateProperty.all(
                TextStyle(
                  color: AppColorCommon.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textStyle: WidgetStateProperty.all(
                TextStyle(
                  color: AppColorCommon.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
