import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/entities/event.dart';
import 'package:evently_app/core/models/event_model.dart';
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
            .orderBy('createdAt', descending: true)
            .get();
    final events =
        res.docs
            .map((doc) => EventModel.fromFirestore(doc.data(), doc.id))
            .toList();
    if (res.docs.isNotEmpty) {
      emit(GetEventSuccess(events: events));
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

      final events =
          res.docs
              .map((doc) => EventModel.fromFirestore(doc.data(), doc.id))
              .toList();

      if (res.docs.isNotEmpty) {
        emit(GetEventSuccess(events: events));
      } else {
        emit(NoEvent(message: "No event found for this category"));
      }
    } catch (e) {
      emit(GetEventError(message: e.toString()));
    }
  }
}
