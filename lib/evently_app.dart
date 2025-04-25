import 'package:evently_app/core/app_theme/theme/dark_theme.dart';
import 'package:evently_app/core/app_theme/theme/light_them.dart';
import 'package:evently_app/features/app_intro/view/screens/intro_screen.dart';
import 'package:evently_app/features/app_intro/view/screens/onboarding_screen.dart';
import 'package:evently_app/features/auth/view/screens/forget_password_screen.dart';
import 'package:evently_app/features/auth/view/screens/sign_in_screen.dart';
import 'package:evently_app/features/auth/view/screens/sign_up_screen.dart';
import 'package:evently_app/features/main_layout/view/screens/main_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getLightTheme(),
          darkTheme: getDarkTheme(),
          themeMode: ThemeMode.dark,
          home: child,
          routes: {
            '/intro': (context) => const IntroScreen(),
            '/onboarding': (context) => const OnboardingScreen(),
            '/signIn': (context) => const SignInScreen(),
            '/signUp': (context) => const SignUpScreen(),
            '/forgetPassword': (context) => const ForgetPasswordScreen(),
            '/mainLayout': (context) => const MainLayoutScreen(),
          },
        );
      },
      child: const IntroScreen(),
    );
  }
}
