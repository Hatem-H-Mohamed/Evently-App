import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());

  Future<List<String>> getUserFavEventIds(String userId) async {
    final favSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('favs')
            .get();

    return favSnapshot.docs.map((doc) => doc.id).toList();
  }

  Future<List<Map<String, dynamic>>> getUserFavEvents(String userId) async {
    final favIds = await getUserFavEventIds(userId);

    if (favIds.isEmpty) return [];

    List<Map<String, dynamic>> favEvents = [];

    // Batch into chunks of 10 for Firestore whereIn limit
    for (var i = 0; i < favIds.length; i += 10) {
      final batchIds = favIds.sublist(
        i,
        i + 10 > favIds.length ? favIds.length : i + 10,
      );

      final eventsSnapshot =
          await FirebaseFirestore.instance
              .collection('events')
              .where(FieldPath.documentId, whereIn: batchIds)
              .get();

      favEvents.addAll(
        eventsSnapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}),
      );
    }

    return favEvents;
  }

  void getFavs(String userId) async {
    emit(FavLoading());
    final res = await getUserFavEvents(userId);
    final cardsIds = await getUserFavEventIds(userId);
    if (res.isEmpty) {
      emit(FavEmpty(message: "No favorite events"));
    } else {
      emit(FavLoaded(events: res, cardsId: cardsIds));
    }
  }

  void searchFav(String query) async {
    final res = await getUserFavEvents(FirebaseAuth.instance.currentUser!.uid);
    final cardsIds = await getUserFavEventIds(
      FirebaseAuth.instance.currentUser!.uid,
    );
    if (query.isEmpty) {
      emit(FavLoaded(events: res, cardsId: cardsIds));
    } else {
      final filtered =
          res.where((event) {
            final title = (event['title'] ?? '').toString().toLowerCase();
            return title.contains(query.toLowerCase());
          }).toList();

      if (filtered.isEmpty) {
        emit(FavEmpty(message: "No events found for \"$query\""));
      } else {
        emit(FavLoaded(events: filtered, cardsId: cardsIds));
      }
    }
  }
}
