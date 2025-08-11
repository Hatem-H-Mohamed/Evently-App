part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetEventLoading extends HomeState {}

final class GetEventSuccess extends HomeState {
  final List<Event> events;
  GetEventSuccess({required this.events});
}

final class GetEventError extends HomeState {
  final String message;
  GetEventError({required this.message});
}

final class NoEvent extends HomeState {
  final String message;
  NoEvent({required this.message});
}
