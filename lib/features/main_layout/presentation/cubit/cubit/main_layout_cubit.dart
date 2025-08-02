import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutInitial());

  void changeIndex(int index) {
    emit(MainLayoutNavigation(index: index));
  }

  void toggleTheme(String theme) {
    if (theme == 'Light') {
      emit(MainLayoutThemeChanged(theme: ThemeMode.light));
    } else if (theme == 'Dark') {
      emit(MainLayoutThemeChanged(theme: ThemeMode.dark));
    }
  }

  void changeLanguage(String language) {
    print("called ================================");
    if (language == 'en') {
      emit(MainLayoutLanguageChanged(language: 'en'));
    } else if (language == 'ar') {
      emit(MainLayoutLanguageChanged(language: 'ar'));
    }
  }
}
