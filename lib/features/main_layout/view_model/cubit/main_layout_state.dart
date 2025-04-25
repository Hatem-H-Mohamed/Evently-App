part of 'main_layout_cubit.dart';

@immutable
sealed class MainLayoutState {}

final class MainLayoutInitial extends MainLayoutState {}

final class MainLayoutNavigation extends MainLayoutState {
  final int index;
  MainLayoutNavigation({required this.index});
}
