part of 'create_event_cubit.dart';

@immutable
sealed class CreateEventState {}

final class CreateEventInitial extends CreateEventState {}

final class CategoryChanged extends CreateEventState {
  final int index;
  CategoryChanged({required this.index});
}

final class LocationLoaded extends CreateEventState {
  final Position location;
  LocationLoaded({required this.location});
}

final class LocationError extends CreateEventState {
  final String message;
  LocationError({required this.message});
}

final class LocationLoading extends CreateEventState {}

final class PlaceNameLoaded extends CreateEventState {
  final String placeName;
  final double latitude;
  final double longitude;
  PlaceNameLoaded({
    required this.latitude,
    required this.longitude,
    required this.placeName,
  });
}

final class PlaceNameError extends CreateEventState {
  final String message;
  PlaceNameError({required this.message});
}

final class PlaceNameLoading extends CreateEventState {}

final class AddEventLoading extends CreateEventState {}

final class AddEventSuccess extends CreateEventState {}

final class AddEventError extends CreateEventState {
  final String message;
  AddEventError({required this.message});
}

final class EventDetailsLoading extends CreateEventState {}

final class EventDetailsSuccess extends CreateEventState {
  final Event event;
  EventDetailsSuccess({required this.event});
}

final class EventDetailsError extends CreateEventState {
  final String message;
  EventDetailsError({required this.message});
}

final class DeleteEventLoading extends CreateEventState {}

final class DeleteEventSuccess extends CreateEventState {}

final class DeleteEventError extends CreateEventState {
  final String message;
  DeleteEventError({required this.message});
}
