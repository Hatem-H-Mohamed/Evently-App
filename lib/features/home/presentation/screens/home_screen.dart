import 'dart:ffi';

import 'package:evently_app/core/app_assets/icons/app_icons.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_dark.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:evently_app/core/helper/lang_helper.dart';
import 'package:evently_app/core/widgets/event_card.dart';
import 'package:evently_app/features/home/presentation/widgets/cat_taps.dart';
import 'package:evently_app/features/main_layout/presentation/cubit/cubit/main_layout_cubit.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 185.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color:
                  Theme.of(context).brightness == Brightness.light
                      ? AppColorCommon.primary
                      : AppColorDark.background,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35.r),
                bottomRight: Radius.circular(35.r),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            S.of(context).WelcomeBack,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColorLight.background,
                            ),
                          ),
                          Text(
                            " John Safwat",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColorLight.background,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          context.read<MainLayoutCubit>().toggleTheme(
                            Theme.of(context).brightness == Brightness.light
                                ? 'Dark'
                                : 'Light',
                          );
                        },
                        child: SvgPicture.asset(AppIconsSvg.sun),
                      ),
                      SizedBox(width: 5.w),
                      InkWell(
                        onTap: () {
                          context.read<MainLayoutCubit>().changeLanguage(
                            LangHelper.isArabic() ? 'en' : 'ar',
                          );
                        },
                        child: Container(
                          height: 33.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColorLight.background,
                          ),
                          child: Center(
                            child: Text(
                              S.of(context).CurrLang,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).brightness ==
                                            Brightness.light
                                        ? AppColorCommon.primary
                                        : AppColorDark.background,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIconsSvg.mapUnselected),
                          SizedBox(width: 4.w),
                          Text(
                            "cairo, Egypt",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColorLight.background,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      CatTaps(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: EventCard(
                    imageID: 2,
                    title: 'Birthday Party',
                    date: '12 Nov',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
