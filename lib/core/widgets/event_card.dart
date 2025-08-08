import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_dark.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:evently_app/core/consts/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as it;

class EventCard extends StatefulWidget {
  final int imageID;
  final String title;
  final String date;
  const EventCard({
    super.key,
    required this.imageID,
    required this.title,
    required this.date,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColorCommon.primary, width: 1.r),
        borderRadius: BorderRadius.circular(17.r),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              Theme.of(context).brightness == Brightness.light
                  ? CategoryList.categoriesLight[widget.imageID]
                  : CategoryList.categoriesDark[widget.imageID],
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8.h,
            left: 8.w,
            child: Container(
              width: 45.w,
              height: 49.h,
              decoration: BoxDecoration(
                color:
                    Theme.of(context).brightness == Brightness.light
                        ? AppColorLight.background
                        : AppColorDark.background,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    it.DateFormat(
                      'dd',
                    ).format(it.DateFormat('dd/MM/yyyy').parse(widget.date)),
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColorCommon.primary,
                    ),
                  ),
                  Text(
                    it.DateFormat(
                      'MMM',
                    ).format(it.DateFormat('dd/MM/yyyy').parse(widget.date)),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColorCommon.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8.h,
            left: 8.w,
            right: 8.w,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                width: 345.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).brightness == Brightness.light
                          ? AppColorLight.background
                          : AppColorDark.background,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColorCommon.primary
                                  : AppColorLight.background,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        icon:
                            isFavorite
                                ? Icon(
                                  Icons.favorite,
                                  color: AppColorCommon.primary,
                                )
                                : Icon(
                                  Icons.favorite_border,
                                  color: AppColorCommon.primary,
                                ),
                        color: AppColorCommon.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
