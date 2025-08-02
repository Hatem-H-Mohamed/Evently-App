import 'package:evently_app/core/app_assets/icons/App_icons.dart';
import 'package:evently_app/core/app_assets/images/app_images.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/cutom_animated_toggle_switch.dart';
import 'package:evently_app/features/app_intro/presentation/widgets/intro_component.dart';
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
              Image.asset(AppImages.onboardingLogo, height: 50.h, width: 157.w),
              SizedBox(height: 28.h),
              IntroComponent(
                title: "Personalize Your Experience",
                description:
                    "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                image: AppImages.onboardingImage0,
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
                  CutomAnimatedToggleSwitch(
                    icons: [
                      SvgPicture.asset(
                        fit: BoxFit.fill,
                        AppIconsSvg.onboardingUsa,
                        width: 20.w,
                        height: 20.h,
                      ),
                      SvgPicture.asset(
                        fit: BoxFit.fill,
                        AppIconsSvg.onboardingEg,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ],
                    onTap: (i) {},
                    onToggle: (i) {},
                    current: 0,
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
                  CutomAnimatedToggleSwitch(
                    icons: [
                      SvgPicture.asset(
                        fit: BoxFit.fill,
                        AppIconsSvg.onboardingSun,
                        width: 20.w,
                        height: 20.h,
                        colorFilter: ColorFilter.mode(
                          AppColorCommon.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      SvgPicture.asset(
                        fit: BoxFit.fill,
                        AppIconsSvg.onboardingMoon,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ],
                    onTap: (i) {},
                    onToggle: (i) {},
                    current: 0,
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              CustomElevatedButton(
                title: "Let's Start",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/onboarding');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
