import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/core/app_assets/app_assets.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/features/app_intro/view/widgets/custom_elevated_button.dart';
import 'package:evently_app/features/app_intro/view/widgets/intro_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Image.asset(AppAssets.onboardingLogo, height: 50.h, width: 157.w),
              SizedBox(height: 28.h),
              IntroComponent(
                title: "Personalize Your Experience",
                description:
                    "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                image: AppAssets.onboardingImage0,
              ),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Language",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColorCommon.primary,
                    ),
                  ),
                  AnimatedToggleSwitch<int>.rolling(
                    indicatorSize: Size(30.w, 27.h),
                    style: ToggleStyle(
                      borderColor: AppColorCommon.primary,
                      borderRadius: BorderRadius.circular(30.r),
                      indicatorBorder: Border.fromBorderSide(
                        BorderSide(width: 5.r, color: AppColorCommon.primary),
                      ),
                      indicatorBorderRadius: BorderRadius.circular(45.r),
                      indicatorColor: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    height: 31.h,
                    spacing: 7.w,
                    borderWidth: 3.r,
                    current: 0,
                    values: [0, 1],
                    onChanged: (i) => {},
                    iconList: [
                      SvgPicture.asset(
                        fit: BoxFit.fill,
                        AppAssets.onboardingUsa,
                        width: 20.w,
                        height: 20.h,
                      ),
                      SvgPicture.asset(
                        fit: BoxFit.fill,
                        AppAssets.onboardingEg,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Theme",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColorCommon.primary,
                    ),
                  ),
                  AnimatedToggleSwitch<int>.rolling(
                    indicatorSize: Size(30.w, 27.h),
                    style: ToggleStyle(
                      borderColor: AppColorCommon.primary,
                      borderRadius: BorderRadius.circular(30.r),
                      indicatorBorder: Border.fromBorderSide(
                        BorderSide(width: 5.r, color: AppColorCommon.primary),
                      ),
                      indicatorBorderRadius: BorderRadius.circular(45.r),
                      indicatorColor: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    height: 31.h,
                    spacing: 7.w,
                    borderWidth: 3.r,
                    current: 0,
                    values: [0, 1],
                    onChanged: (i) => {},
                    iconList: [
                      SvgPicture.asset(
                        fit: BoxFit.fill,
                        AppAssets.onboardingSun,
                        width: 20.w,
                        height: 20.h,
                        colorFilter: ColorFilter.mode(
                          AppColorCommon.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      SvgPicture.asset(
                        fit: BoxFit.fill,
                        AppAssets.onboardingMoon,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              CustomElevatedButton(title: "Let's Start", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
