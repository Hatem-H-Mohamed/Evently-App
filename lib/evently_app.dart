import 'package:evently_app/core/app_theme/theme/dark_theme.dart';
import 'package:evently_app/core/app_theme/theme/light_them.dart';
import 'package:evently_app/features/app_intro/presentation/screens/intro_screen.dart';
import 'package:evently_app/features/app_intro/presentation/screens/onboarding_screen.dart';
import 'package:evently_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:evently_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:evently_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:evently_app/features/main_layout/presentation/cubit/cubit/main_layout_cubit.dart';
import 'package:evently_app/features/main_layout/presentation/screens/main_layout_screen.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      builder: (_, child) {
        return BlocBuilder<MainLayoutCubit, MainLayoutState>(
          buildWhen:
              (previous, current) =>
                  current is MainLayoutThemeChanged ||
                  current is MainLayoutLanguageChanged,
          builder: (context, state) {
            return MaterialApp(
              locale: Locale(
                state is MainLayoutLanguageChanged
                    ? state.language
                    : Intl.getCurrentLocale(),
              ),

              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,

              debugShowCheckedModeBanner: false,
              theme: getLightTheme(),
              darkTheme: getDarkTheme(),
              themeMode:
                  state is MainLayoutThemeChanged
                      ? state.theme
                      : Theme.of(context).brightness == Brightness.light
                      ? ThemeMode.light
                      : ThemeMode.dark,
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
        );
      },
      child: const MainLayoutScreen(),
    );
  }
}
