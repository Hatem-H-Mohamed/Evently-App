part of 'create_event_cubit.dart';

@immutable
sealed class CreateEventState {}

final class CreateEventInitial extends CreateEventState {}

final class CategoryChanged extends CreateEventState {
  final int index;
  CategoryChanged({required this.index});
}
