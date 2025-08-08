import 'package:evently_app/core/app_assets/icons/App_icons.dart';
import 'package:evently_app/core/app_assets/images/app_images.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/helper/lang_helper.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/cutom_animated_toggle_switch.dart';
import 'package:evently_app/features/app_intro/presentation/widgets/intro_component.dart';
import 'package:evently_app/features/main_layout/presentation/cubit/cubit/main_layout_cubit.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndexLang = LangHelper.isArabic() ? 1 : 0;
  int currentIndexTheme = 0;

  @override
  void initState() {
    super.initState();
  }

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
                title: S.of(context).Personalize,
                description: S.of(context).Choose,
                image: AppImages.onboardingImage0,
              ),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).Language,
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
                    onTap: (i) {
                      setState(() {
                        currentIndexLang = i.values[0];
                      });
                    },
                    onToggle: (i) {
                      setState(() {
                        currentIndexLang = i;
                      });
                      context.read<MainLayoutCubit>().changeLanguage(
                        currentIndexLang == 0 ? "en" : "ar",
                      );
                    },
                    current: currentIndexLang,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).Theme,
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
                    onTap: (i) {
                      setState(() {
                        currentIndexTheme = i.values[0];
                      });
                    },
                    onToggle: (i) {
                      setState(() {
                        currentIndexTheme = i;
                      });
                      context.read<MainLayoutCubit>().toggleTheme(
                        currentIndexTheme == 0 ? 'Light' : 'Dark',
                      );
                    },
                    current: currentIndexTheme,
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              CustomElevatedButton(
                title: S.of(context).Let,
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
