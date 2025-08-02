import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroComponent extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const IntroComponent({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, width: 361.w, height: 361.h),
        SizedBox(height: 28.h),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColorCommon.primary,
            ),
          ),
        ),
        SizedBox(height: 28.h),
        Text(
          description,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
