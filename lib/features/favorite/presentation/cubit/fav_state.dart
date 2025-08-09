part of 'fav_cubit.dart';

@immutable
sealed class FavState {}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class FavEmpty extends FavState {
  final String message;
  FavEmpty({required this.message});
}

final class FavLoaded extends FavState {
  final List<Map<String, dynamic>> events;
  final List<String> cardsId;
  FavLoaded({required this.cardsId, required this.events});
}
