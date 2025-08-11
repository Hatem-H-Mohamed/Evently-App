import 'dart:typed_data';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:evently_app/core/app_assets/icons/app_icons.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/consts/category_list.dart';
import 'package:evently_app/core/entities/event.dart';
import 'package:evently_app/features/events/presentation/cubit/create_event_cubit.dart';
import 'package:evently_app/features/events/presentation/screens/edit_event_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;

class EventDetailsScreen extends StatefulWidget {
  final String? eventId;
  const EventDetailsScreen({super.key, this.eventId});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  void initState() {
    print("============");
    print(widget.eventId);
    super.initState();
    context.read<CreateEventCubit>().getEventDetails(widget.eventId!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEventCubit, CreateEventState>(
      builder: (context, state) {
        if (state is EventDetailsLoading) {
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
            body: Center(
              child: CircularProgressIndicator(color: AppColorCommon.primary),
            ),
          );
        } else if (state is EventDetailsSuccess) {
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
              actions: [
                Visibility(
                  visible:
                      state.event.userId ==
                              FirebaseAuth.instance.currentUser!.uid
                          ? true
                          : false,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => EditEventScreen(
                                imageId: state.event.imageId,
                                title: state.event.title,
                                description: state.event.description,
                                date: state.event.date,
                                time: state.event.time,
                                placeName: state.event.placeName,
                                eventId: state.event.id,
                                latitude: state.event.latitude,
                                longitude: state.event.longitude,
                              ),
                        ),
                      );
                    },
                    icon: SvgPicture.asset(
                      AppIconsSvg.noteEdit2,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                ),
                Visibility(
                  visible:
                      state.event.userId ==
                              FirebaseAuth.instance.currentUser!.uid
                          ? true
                          : false,
                  child: IconButton(
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogBackgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        dialogType: DialogType.noHeader,
                        animType: AnimType.scale,
                        title: 'Delete event',
                        desc: 'Are you sure you want to delete this event?',

                        titleTextStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColorCommon.primary,
                        ),
                        descTextStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        btnOkText: 'Yes',

                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/mainLayout',
                            (route) => false,
                          );
                          context.read<CreateEventCubit>().deleteEvent(
                            state.event.id,
                          );
                        },
                      ).show();
                    },
                    icon: SvgPicture.asset(
                      AppIconsSvg.noteDelete,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                ),
              ],
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
                            ? CategoryList.categoriesLight[state.event.imageId]
                            : CategoryList.categoriesDark[state.event.imageId],
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      state.event.title,
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
                                    color:
                                        Theme.of(
                                          context,
                                        ).scaffoldBackgroundColor,
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
                                  state.event.date,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColorCommon.primary,
                                  ),
                                ),
                              ),
                              Text(
                                state.event.time,
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
                                    color:
                                        Theme.of(
                                          context,
                                        ).scaffoldBackgroundColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            state.event.placeName,
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
                        child: mapbox.MapWidget(
                          styleUri:
                              Theme.of(context).brightness == Brightness.light
                                  ? mapbox.MapboxStyles.LIGHT
                                  : mapbox.MapboxStyles.DARK,
                          onMapCreated: (ctrl) async {
                            ctrl.scaleBar.updateSettings(
                              mapbox.ScaleBarSettings(enabled: false),
                            );
                            ctrl.setCamera(
                              mapbox.CameraOptions(
                                zoom: 13,
                                center: mapbox.Point(
                                  coordinates: mapbox.Position(
                                    state.event.longitude,
                                    state.event.latitude,
                                  ),
                                ),
                              ),
                            );

                            ctrl.annotations
                                .createPointAnnotationManager()
                                .then((pointAnnotationManager) async {
                                  final ByteData bytes = await rootBundle.load(
                                    "assets/map/map_marker.png",
                                  );

                                  final Uint8List list =
                                      bytes.buffer.asUint8List();

                                  var options =
                                      <mapbox.PointAnnotationOptions>[];

                                  options.add(
                                    mapbox.PointAnnotationOptions(
                                      geometry: mapbox.Point(
                                        coordinates: mapbox.Position(
                                          state.event.longitude,
                                          state.event.latitude,
                                        ),
                                      ),
                                      iconSize: 0.1,
                                      image: list,
                                      iconAnchor: mapbox.IconAnchor.BOTTOM,
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
                      state.event.description,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: AppColorCommon.primary),
          );
        }
      },
    );
  }
}
