import 'package:evently_app/core/app_assets/images/app_images.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/features/app_intro/presentation/widgets/intro_component.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> components = [
      IntroComponent(
        title: S.of(context).Find,
        description: S.of(context).Dive,
        image: AppImages.onboardingImage1,
      ),
      IntroComponent(
        title: S.of(context).Effortless,
        description: S.of(context).Take,
        image: AppImages.onboardingImage2,
      ),
      IntroComponent(
        title: S.of(context).Connect,
        description: S.of(context).Make,
        image: AppImages.onboardingImage3,
      ),
    ];

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              children: [
                SizedBox(height: 15.h),
                Center(
                  child: Image.asset(
                    AppImages.onboardingLogo,
                    height: 50.h,
                    width: 157.w,
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  height: 651.h,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (value) {
                      _index = value;
                      setState(() {});
                    },
                    children: components,
                  ),
                ),

                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IgnorePointer(
                      ignoring: _index == 0,
                      child: Opacity(
                        opacity: _index == 0 ? 0.0 : 1.0,
                        child: IconButton(
                          iconSize: 37.r,
                          icon: Icon(
                            Icons.arrow_circle_left_outlined,
                            color: AppColorCommon.primary,
                          ),
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: WormEffect(
                        dotColor:
                            Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                        activeDotColor: AppColorCommon.primary,
                        dotHeight: 8.h,
                        dotWidth: 8.w,
                      ),
                    ),

                    IconButton(
                      iconSize: 37.r,
                      icon: Icon(
                        Icons.arrow_circle_right_outlined,
                        color: AppColorCommon.primary,
                      ),
                      onPressed: () async {
                        if (_index == 2) {
                          Navigator.of(context).pushNamed('/signIn');
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool("isFirst", false);
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
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
