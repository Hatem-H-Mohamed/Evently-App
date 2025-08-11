import 'package:evently_app/core/entities/event.dart';

class EventModel extends Event {
  const EventModel({
    required super.id,
    required super.date,
    required super.description,
    required super.imageId,
    required super.latitude,
    required super.longitude,
    required super.placeName,
    required super.time,
    required super.title,
    required super.userId,
  });

  factory EventModel.fromFirestore(Map<String, dynamic> json, String id) {
    return EventModel(
      id: id,
      date: json['date'],
      description: json['description'],
      imageId: json['imageId'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      placeName: json['placeName'],
      time: json['time'],
      title: json['title'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'date': date,
      'description': description,
      'imageId': imageId,
      'latitude': latitude,
      'longitude': longitude,
      'placeName': placeName,
      'time': time,
      'title': title,
      'userId': userId,
    };
  }
}
