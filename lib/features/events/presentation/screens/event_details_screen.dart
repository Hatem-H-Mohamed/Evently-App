import 'dart:typed_data';

import 'package:evently_app/core/app_assets/icons/app_icons.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/consts/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class EventDetailsScreen extends StatefulWidget {
  final int? imageId;
  final String? title;
  final String? description;
  final String? date;
  final String? time;
  final String? placeName;
  final double? latitude;
  final double? longitude;
  const EventDetailsScreen({
    super.key,
    this.imageId,
    this.title,
    this.description,
    this.date,
    this.time,
    this.latitude,
    this.longitude,
    this.placeName,
  });

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColorCommon.primary,
        centerTitle: true,
        title: const Text('Event Details'),
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20.sp,
          color: AppColorCommon.primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.light
                      ? CategoryList.categoriesLight[widget.imageId ?? 0]
                      : CategoryList.categoriesDark[widget.imageId ?? 0],
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                widget.title ?? 'title',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColorCommon.primary,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                height: 62.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColorCommon.primary),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: 46.w,
                        height: 46.h,
                        decoration: BoxDecoration(
                          color: AppColorCommon.primary,
                          borderRadius: BorderRadius.circular(8.r),
                        ),

                        child: Center(
                          child: SizedBox(
                            child: SvgPicture.asset(
                              AppIconsSvg.calender,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            widget.date ?? 'date',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColorCommon.primary,
                            ),
                          ),
                        ),
                        Text(
                          widget.time ?? 'time',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColorCommon.black,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 9, 0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: AppColorCommon.primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                height: 62.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColorCommon.primary),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: 46.w,
                        height: 46.h,
                        decoration: BoxDecoration(
                          color: AppColorCommon.primary,
                          borderRadius: BorderRadius.circular(8.r),
                        ),

                        child: Center(
                          child: SizedBox(
                            child: SvgPicture.asset(
                              AppIconsSvg.location,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      widget.placeName ?? 'location',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColorCommon.primary,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 9, 0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: AppColorCommon.primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                height: 361.h,
                width: 361.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColorCommon.primary),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: MapWidget(
                    styleUri:
                        Theme.of(context).brightness == Brightness.light
                            ? MapboxStyles.LIGHT
                            : MapboxStyles.DARK,
                    onMapCreated: (ctrl) async {
                      ctrl.scaleBar.updateSettings(
                        ScaleBarSettings(enabled: false),
                      );
                      print(widget.longitude!.toInt());
                      print(widget.latitude!.toInt());
                      print("============");
                      ctrl.setCamera(
                        CameraOptions(
                          zoom: 13,
                          center: Point(
                            coordinates: Position(
                              widget.longitude!,
                              widget.latitude!,
                            ),
                          ),
                        ),
                      );

                      ctrl.annotations.createPointAnnotationManager().then((
                        pointAnnotationManager,
                      ) async {
                        final ByteData bytes = await rootBundle.load(
                          "assets/map/map_marker.png",
                        );

                        final Uint8List list = bytes.buffer.asUint8List();

                        var options = <PointAnnotationOptions>[];

                        options.add(
                          PointAnnotationOptions(
                            geometry: Point(
                              coordinates: Position(
                                widget.longitude!,
                                widget.latitude!,
                              ),
                            ),
                            iconSize: 0.1,
                            image: list,
                            iconAnchor: IconAnchor.BOTTOM,
                          ),
                        );

                        pointAnnotationManager.createMulti(options);
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Description:",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColorCommon.primary,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                widget.description!,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
