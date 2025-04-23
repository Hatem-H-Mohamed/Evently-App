import 'package:evently_app/core/app_theme/theme/dark_theme.dart';
import 'package:evently_app/core/app_theme/theme/light_them.dart';
import 'package:evently_app/features/app_intro/view/screens/intro_screen.dart';
import 'package:evently_app/features/app_intro/view/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getLightTheme(),
          darkTheme: getDarkTheme(),
          themeMode: ThemeMode.light,
          home: child,
        );
      },
      child: const OnboardingScreen(),
    );
  }
}
