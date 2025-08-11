part of 'map_cubit.dart';

@immutable
sealed class MapState {}

final class MapInitial extends MapState {}

final class MoveTo extends MapState {
  final double latitude;
  final double longitude;

  MoveTo({required this.latitude, required this.longitude});
}
