// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Language`
  String get Language {
    return Intl.message('Language', name: 'Language', desc: '', args: []);
  }

  /// `English`
  String get English {
    return Intl.message('English', name: 'English', desc: '', args: []);
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message('Arabic', name: 'Arabic', desc: '', args: []);
  }

  /// `Theme`
  String get Theme {
    return Intl.message('Theme', name: 'Theme', desc: '', args: []);
  }

  /// `Light`
  String get Light {
    return Intl.message('Light', name: 'Light', desc: '', args: []);
  }

  /// `Dark`
  String get Dark {
    return Intl.message('Dark', name: 'Dark', desc: '', args: []);
  }

  /// `Logout`
  String get Logout {
    return Intl.message('Logout', name: 'Logout', desc: '', args: []);
  }

  /// `Home`
  String get Home {
    return Intl.message('Home', name: 'Home', desc: '', args: []);
  }

  /// `Map`
  String get Map {
    return Intl.message('Map', name: 'Map', desc: '', args: []);
  }

  /// `Love`
  String get Love {
    return Intl.message('Love', name: 'Love', desc: '', args: []);
  }

  /// `Profile`
  String get Profile {
    return Intl.message('Profile', name: 'Profile', desc: '', args: []);
  }

  /// `Email`
  String get Email {
    return Intl.message('Email', name: 'Email', desc: '', args: []);
  }

  /// `Password`
  String get Password {
    return Intl.message('Password', name: 'Password', desc: '', args: []);
  }

  /// `Forget Password?`
  String get ForgotPassword {
    return Intl.message(
      'Forget Password?',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message('Login', name: 'Login', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get noAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get CreateAccount {
    return Intl.message(
      'Create Account',
      name: 'CreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get Or {
    return Intl.message('Or', name: 'Or', desc: '', args: []);
  }

  /// `Login with Google`
  String get LoginwithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'LoginwithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message('Register', name: 'Register', desc: '', args: []);
  }

  /// `Name`
  String get Name {
    return Intl.message('Name', name: 'Name', desc: '', args: []);
  }

  /// `Re Password`
  String get RePassword {
    return Intl.message('Re Password', name: 'RePassword', desc: '', args: []);
  }

  /// `Already Have Account ?`
  String get AlreadyHaveAccount {
    return Intl.message(
      'Already Have Account ?',
      name: 'AlreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get ResetPassword {
    return Intl.message(
      'Reset Password',
      name: 'ResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get ForgetPassword {
    return Intl.message(
      'Forget Password',
      name: 'ForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back ✨`
  String get WelcomeBack {
    return Intl.message(
      'Welcome Back ✨',
      name: 'WelcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `EN`
  String get CurrLang {
    return Intl.message('EN', name: 'CurrLang', desc: '', args: []);
  }

  /// `All`
  String get All {
    return Intl.message('All', name: 'All', desc: '', args: []);
  }

  /// `Sport`
  String get Sport {
    return Intl.message('Sport', name: 'Sport', desc: '', args: []);
  }

  /// `Birthday`
  String get Birthday {
    return Intl.message('Birthday', name: 'Birthday', desc: '', args: []);
  }

  /// `Meeting`
  String get Meeting {
    return Intl.message('Meeting', name: 'Meeting', desc: '', args: []);
  }

  /// `Gaming`
  String get Gaming {
    return Intl.message('Gaming', name: 'Gaming', desc: '', args: []);
  }

  /// `Eating`
  String get Eating {
    return Intl.message('Eating', name: 'Eating', desc: '', args: []);
  }

  /// `Holiday`
  String get Holiday {
    return Intl.message('Holiday', name: 'Holiday', desc: '', args: []);
  }

  /// `Exhibition`
  String get Exhibition {
    return Intl.message('Exhibition', name: 'Exhibition', desc: '', args: []);
  }

  /// `Workshop`
  String get Workshop {
    return Intl.message('Workshop', name: 'Workshop', desc: '', args: []);
  }

  /// `Book Club`
  String get BookClub {
    return Intl.message('Book Club', name: 'BookClub', desc: '', args: []);
  }

  /// `Loading...`
  String get Loading {
    return Intl.message('Loading...', name: 'Loading', desc: '', args: []);
  }

  /// `Welcome!`
  String get Success {
    return Intl.message('Welcome!', name: 'Success', desc: '', args: []);
  }

  /// `Check your email to reset password`
  String get ResetEmailSuccess {
    return Intl.message(
      'Check your email to reset password',
      name: 'ResetEmailSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Try Again :<`
  String get TryAgain {
    return Intl.message('Try Again :<', name: 'TryAgain', desc: '', args: []);
  }

  /// `Personalize Your Experience`
  String get Personalize {
    return Intl.message(
      'Personalize Your Experience',
      name: 'Personalize',
      desc: '',
      args: [],
    );
  }

  /// `Find Events That Inspire You`
  String get Find {
    return Intl.message(
      'Find Events That Inspire You',
      name: 'Find',
      desc: '',
      args: [],
    );
  }

  /// `Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.`
  String get Choose {
    return Intl.message(
      'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
      name: 'Choose',
      desc: '',
      args: [],
    );
  }

  /// `Let's Start`
  String get Let {
    return Intl.message('Let\'s Start', name: 'Let', desc: '', args: []);
  }

  /// `Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art  , professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.`
  String get Dive {
    return Intl.message(
      'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art  , professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
      name: 'Dive',
      desc: '',
      args: [],
    );
  }

  /// `Effortless Event Planning`
  String get Effortless {
    return Intl.message(
      'Effortless Event Planning',
      name: 'Effortless',
      desc: '',
      args: [],
    );
  }

  /// `Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.`
  String get Take {
    return Intl.message(
      'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
      name: 'Take',
      desc: '',
      args: [],
    );
  }

  /// `Connect with Friends & Share Moments`
  String get Connect {
    return Intl.message(
      'Connect with Friends & Share Moments',
      name: 'Connect',
      desc: '',
      args: [],
    );
  }

  /// `Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.`
  String get Make {
    return Intl.message(
      'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
      name: 'Make',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
