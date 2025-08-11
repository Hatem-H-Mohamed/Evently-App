import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/entities/event.dart';
import 'package:evently_app/core/models/event_model.dart';
import 'package:evently_app/features/events/domain/usecases/get_current_location_usecase.dart';
import 'package:evently_app/features/events/domain/usecases/get_place_name_usecase.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

part 'create_event_state.dart';

@injectable
class CreateEventCubit extends Cubit<CreateEventState> {
  final GetCurrentLocationUsecase getCurrentLocationUsecase;
  final GetPlaceNameUsecase getPlaceNameUsecase;
  CreateEventCubit({
    required this.getCurrentLocationUsecase,
    required this.getPlaceNameUsecase,
  }) : super(CreateEventInitial());

  void changeCatImage(int index) {
    emit(CategoryChanged(index: index));
  }

  void getCurrentLocation() async {
    emit(LocationLoading());
    final res = await getCurrentLocationUsecase.call(null);
    res.fold((failure) => emit(LocationError(message: failure.message)), (
      data,
    ) {
      emit(LocationLoaded(location: data));
    });
  }

  void getPlaceName(LocationParams params) async {
    emit(PlaceNameLoading());
    final res = await getPlaceNameUsecase.call(params);
    res.fold((failure) => emit(PlaceNameError(message: failure.message)), (
      data,
    ) {
      emit(
        PlaceNameLoaded(
          placeName: data,
          latitude: params.latitude,
          longitude: params.longitude,
        ),
      );
    });
  }

  void addEvent(
    int imageId,
    String title,
    String description,
    String date,
    String time,
    String placeName,
    double latitude,
    double longitude,
  ) async {
    emit(AddEventLoading());
    final res = await FirebaseFirestore.instance.collection('events').add({
      'imageId': imageId,
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'placeName': placeName,
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'latitude': latitude,
      'longitude': longitude,
      'createdAt': Timestamp.now(),
    });
    if (res.id.isNotEmpty) {
      emit(AddEventSuccess());
    } else {
      emit(AddEventError(message: "Try again"));
    }
  }

  void deleteEvent(String eventId) async {
    emit(DeleteEventLoading());
    try {
      await FirebaseFirestore.instance
          .collection('events')
          .doc(eventId)
          .delete();
      emit(DeleteEventSuccess());
    } catch (e) {
      emit(DeleteEventError(message: e.toString()));
    }
  }

  void updateEvent(
    String eventId,
    int imageId,
    String title,
    String description,
    String date,
    String time,
    String placeName,
    double latitude,
    double longitude,
  ) async {
    emit(AddEventLoading());

    try {
      await FirebaseFirestore.instance
          .collection('events')
          .doc(eventId)
          .update({
            'imageId': imageId,
            'title': title,
            'description': description,
            'date': date,
            'time': time,
            'placeName': placeName,
            'userId': FirebaseAuth.instance.currentUser!.uid,
            'latitude': latitude,
            'longitude': longitude,
            'createdAt': Timestamp.now(),
          });

      emit(AddEventSuccess());
    } catch (e) {
      emit(AddEventError(message: e.toString()));
    }
  }

  void getEventDetails(String eventId) async {
    emit(EventDetailsLoading());
    final res =
        await FirebaseFirestore.instance
            .collection('events')
            .doc(eventId)
            .get();
    final event = EventModel.fromFirestore(res.data()!, res.id);
    if (res.exists) {
      emit(EventDetailsSuccess(event: event));
    } else {
      emit(EventDetailsError(message: "Try again"));
    }
  }
}
