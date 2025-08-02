part of 'main_layout_cubit.dart';

@immutable
sealed class MainLayoutState {}

final class MainLayoutInitial extends MainLayoutState {}

final class MainLayoutNavigation extends MainLayoutState {
  final int index;
  MainLayoutNavigation({required this.index});
}

final class MainLayoutThemeChanged extends MainLayoutState {
  final ThemeMode theme;
  MainLayoutThemeChanged({required this.theme});
}

final class MainLayoutLanguageChanged extends MainLayoutState {
  final String language;
  MainLayoutLanguageChanged({required this.language});
}
