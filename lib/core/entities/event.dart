class Event {
  final String id;
  final String date;
  final String description;
  final int imageId;
  final double latitude;
  final double longitude;
  final String placeName;
  final String time;
  final String title;
  final String userId;

  const Event({
    required this.id,
    required this.date,
    required this.description,
    required this.imageId,
    required this.latitude,
    required this.longitude,
    required this.placeName,
    required this.time,
    required this.title,
    required this.userId,
  });
}
