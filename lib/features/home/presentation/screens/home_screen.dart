import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/app_assets/icons/app_icons.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_dark.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:evently_app/core/helper/lang_helper.dart';
import 'package:evently_app/core/widgets/event_card.dart';
import 'package:evently_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:evently_app/features/home/presentation/widgets/cat_taps.dart';
import 'package:evently_app/features/main_layout/presentation/cubit/cubit/main_layout_cubit.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 190.h,
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
                            FirebaseAuth.instance.currentUser!.displayName!,
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
                      CatTaps(tapIndex: 0),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is GetEventLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColorCommon.primary,
                    ),
                  );
                } else if (state is NoEvent) {
                  return Center(child: Text(state.message));
                } else if (state is GetEventSuccess) {
                  return RefreshIndicator(
                    displacement: 0,
                    color: AppColorCommon.primary,
                    onRefresh: () {
                      context.read<HomeCubit>().getEvent();
                      return Future.delayed(const Duration(milliseconds: 200));
                    },
                    child: ListView.builder(
                      itemCount: state.events.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: EventCard(
                            imageID: state.events[index].data()['imageId'],
                            title: state.events[index].data()['title'],
                            date: state.events[index].data()['date'],
                            cardId: state.events[index].id,
                            time: state.events[index].data()['time'],
                            placeName: state.events[index].data()['placeName'],
                            latitude: state.events[index].data()['latitude'],
                            longitude: state.events[index].data()['longitude'],
                            description:
                                state.events[index].data()['description'],
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is GetEventError) {
                  return Center(child: Text(state.message));
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
