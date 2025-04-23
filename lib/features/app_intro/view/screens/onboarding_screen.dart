import 'package:evently_app/core/app_assets/app_assets.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/features/app_intro/view/widgets/intro_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _index = 0;

  List<Widget> components = [
    IntroComponent(
      title: "Find Events That Inspire You",
      description:
          "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art  , professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
      image: AppAssets.onboardingImage1,
    ),
    IntroComponent(
      title: "Effortless Event Planning",
      description:
          "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
      image: AppAssets.onboardingImage2,
    ),
    IntroComponent(
      title: "Connect with Friends & Share Moments",
      description:
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
      image: AppAssets.onboardingImage3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            children: [
              SizedBox(height: 15.h),
              Center(
                child: Image.asset(
                  AppAssets.onboardingLogo,
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
                    onPressed: () {
                      if (_index == 2) {
                        Navigator.pushNamed(context, "");
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
    );
  }
}
