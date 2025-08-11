import 'package:evently_app/core/app_assets/icons/app_icons.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:evently_app/core/consts/category_list.dart';
import 'package:evently_app/features/map/presentation/cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MapEventCard extends StatefulWidget {
  final int imageId;
  final String title;
  final String placeName;
  final double latitude;
  final double longitude;
  const MapEventCard({
    super.key,
    required this.imageId,
    required this.title,
    required this.placeName,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<MapEventCard> createState() => _MapEventCardState();
}

class _MapEventCardState extends State<MapEventCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: () {
          print("==============");
          context.read<MapCubit>().moveCamera(
            widget.latitude,
            widget.longitude,
          );
        },
        child: Container(
          width: 290.w,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColorCommon.primary, width: 1.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 138.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      Theme.of(context).brightness == Brightness.light
                          ? CategoryList.categoriesLight[widget.imageId]
                          : CategoryList.categoriesDark[widget.imageId],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                      width: 140.w,
                      child: Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColorCommon.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIconsSvg.mapUnselected,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColorCommon.black
                                  : AppColorLight.background,
                        ),
                        Text(
                          widget.placeName,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColorCommon.black
                                    : AppColorLight.background,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
