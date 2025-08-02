part of 'main_layout_cubit.dart';

@immutable
class MainLayoutState {
  final int index;
  final ThemeMode theme;
  final String language;

  const MainLayoutState({
    required this.index,
    required this.theme,
    required this.language,
  });

  MainLayoutState copyWith({int? index, ThemeMode? theme, String? language}) {
    return MainLayoutState(
      index: index ?? this.index,
      theme: theme ?? this.theme,
      language: language ?? this.language,
    );
  }
}
