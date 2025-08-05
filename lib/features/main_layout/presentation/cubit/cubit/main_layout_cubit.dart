import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  final String lang;
  final String theme;
  MainLayoutCubit({required this.lang, required this.theme})
    : super(
        MainLayoutState(
          index: 0,
          theme: theme == 'Dark' ? ThemeMode.dark : ThemeMode.light,
          language: lang,
        ),
      );

  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }

  void toggleTheme(String theme) async {
    emit(
      state.copyWith(theme: theme == 'Dark' ? ThemeMode.dark : ThemeMode.light),
    );
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("theme", theme);
  }

  void changeLanguage(String language) async {
    emit(state.copyWith(language: language));

    final prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", language);
  }

  void resetState() {
    emit(
      const MainLayoutState(index: 0, theme: ThemeMode.light, language: 'en'),
    );
  }
}
