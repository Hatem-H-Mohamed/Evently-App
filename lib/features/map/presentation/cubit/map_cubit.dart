import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  void moveCamera(double latitude, double longitude) {
    emit(MoveTo(latitude: latitude, longitude: longitude));
  }
}
