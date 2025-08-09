// ignore_for_file: depend_on_referenced_packages

import 'package:evently_app/core/app_theme/theme/dark_theme.dart';
import 'package:evently_app/core/app_theme/theme/light_them.dart';
import 'package:evently_app/features/app_intro/presentation/screens/intro_screen.dart';
import 'package:evently_app/features/app_intro/presentation/screens/onboarding_screen.dart';
import 'package:evently_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:evently_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:evently_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:evently_app/features/events/presentation/screens/create_event_screen.dart';
import 'package:evently_app/features/events/presentation/screens/event_details_screen.dart';
import 'package:evently_app/features/events/presentation/screens/select_location.dart';
import 'package:evently_app/features/main_layout/presentation/cubit/cubit/main_layout_cubit.dart';
import 'package:evently_app/features/main_layout/presentation/screens/main_layout_screen.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class EventlyApp extends StatelessWidget {
  final bool isFirst;
  final bool isLogged;
  final String lang;
  final String theme;
  const EventlyApp({
    super.key,
    required this.isFirst,
    required this.isLogged,
    required this.lang,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 820),
      builder: (_, child) {
        return BlocBuilder<MainLayoutCubit, MainLayoutState>(
          builder: (context, state) {
            return MaterialApp(
              locale: Locale(state.language),

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
              themeMode: state.theme,
              home: child,
              routes: {
                '/intro': (context) => const IntroScreen(),
                '/onboarding': (context) => const OnboardingScreen(),
                '/signIn': (context) => const SignInScreen(),
                '/signUp': (context) => const SignUpScreen(),
                '/forgetPassword': (context) => const ForgetPasswordScreen(),
                '/mainLayout': (context) => const MainLayoutScreen(),
                '/createEvent': (context) => const CreateEventScreen(),
                '/selectLocation': (context) => const SelectLocation(),
                '/eventDetails': (context) => const EventDetailsScreen(),
              },
            );
          },
        );
      },
      child:
          isFirst
              ? const IntroScreen()
              : isLogged
              ? const MainLayoutScreen()
              : const SignInScreen(),
    );
  }
}
