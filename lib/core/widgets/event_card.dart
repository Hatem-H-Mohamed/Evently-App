import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_dark.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:evently_app/core/consts/category_list.dart';
import 'package:evently_app/features/events/presentation/screens/event_details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as it;

class EventCard extends StatefulWidget {
  final int imageID;
  final String title;
  final String? description;
  final String date;
  final String? time;
  final String? placeName;
  final double? latitude;
  final double? longitude;
  final String cardId;
  const EventCard({
    super.key,
    required this.imageID,
    required this.title,
    required this.date,
    required this.cardId,
    this.description,
    this.time,
    this.placeName,
    this.latitude,
    this.longitude,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFav();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (context) => EventDetailsScreen(
                  imageId: widget.imageID,
                  title: widget.title,
                  date: widget.date,
                  description: widget.description,
                  time: widget.time,
                  placeName: widget.placeName,
                  latitude: widget.latitude,
                  longitude: widget.longitude,
                ),
          ),
        );
      },
      child: Container(
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
                          onPressed: () async {
                            if (isFavorite) {
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .collection('favs')
                                  .doc(widget.cardId)
                                  .delete();

                              setState(() {
                                isFavorite = false;
                              });
                            } else {
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .collection('favs')
                                  .doc(widget.cardId)
                                  .set({
                                    'createdAt': FieldValue.serverTimestamp(),
                                  });
                              setState(() {
                                isFavorite = true;
                              });
                            }
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
      ),
    );
  }

  Future<void> _checkFav() async {
    bool result = await isEventFavorited(widget.cardId);
    setState(() {
      isFavorite = result;
    });
  }

  Future<bool> isEventFavorited(String eventId) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final favDoc =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('favs')
            .doc(eventId)
            .get();

    return favDoc.exists;
  }
}
