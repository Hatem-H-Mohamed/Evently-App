import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit()
    : super(
        const MainLayoutState(index: 0, theme: ThemeMode.light, language: 'en'),
      );

  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }

  void toggleTheme(String theme) {
    emit(
      state.copyWith(theme: theme == 'Dark' ? ThemeMode.dark : ThemeMode.light),
    );
  }

  void changeLanguage(String language) {
    emit(state.copyWith(language: language));
  }
}
