import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_event_state.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  CreateEventCubit() : super(CreateEventInitial());

  void changeCatImage(int index) {
    emit(CategoryChanged(index: index));
  }
}
