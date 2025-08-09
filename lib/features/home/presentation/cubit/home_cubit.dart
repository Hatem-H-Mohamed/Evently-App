import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getEvent() async {
    emit(GetEventLoading());
    final res =
        await FirebaseFirestore.instance
            .collection('events')
            .orderBy('date', descending: false)
            .get();
    if (res.docs.isNotEmpty) {
      emit(GetEventSuccess(events: res.docs));
    } else {
      emit(NoEvent(message: "No event found"));
    }
  }

  void getEventsByImageId(int imageId) async {
    emit(GetEventLoading());
    try {
      final res =
          await FirebaseFirestore.instance
              .collection('events')
              .where('imageId', isEqualTo: imageId)
              .get();

      if (res.docs.isNotEmpty) {
        emit(GetEventSuccess(events: res.docs));
      } else {
        emit(NoEvent(message: "No event found for this category"));
      }
    } catch (e) {
      emit(GetEventError(message: e.toString()));
    }
  }
}
