import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract interface class MapsRemote {
  Future<String> getPlaceNameFromCoordinates(double latitude, double longitude);

  Future<geo.Position> getCurrentLocation();
}

@LazySingleton(as: MapsRemote)
class MapsRemoteImpl implements MapsRemote {
  @override
  Future<String> getPlaceNameFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    final String accessToken = dotenv.env['MAPBOX_ACCESS_TOKEN']!;
    final String url =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/$longitude,$latitude.json?access_token=$accessToken';

    try {
      final Response response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);
      final generalPlace = data['features'][0]['place_name'];
      final parts =
          generalPlace.toString().split(',').map((e) => e.trim()).toList();
      final city = parts[parts.length - 2];
      final country = parts[parts.length - 1];
      return "$city, $country";
    } catch (e) {
      throw Exception('Failed to reverse geocode: $e');
    }
  }

  @override
  Future<geo.Position> getCurrentLocation() async {
    try {
      if (await geo.Geolocator.isLocationServiceEnabled() == false) {
        await geo.Geolocator.requestPermission();
      }
      if (await geo.Geolocator.checkPermission() ==
          geo.LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
      return await geo.Geolocator.getCurrentPosition();
    } catch (e) {
      throw Exception('Failed to get current location: $e');
    }
  }
}
