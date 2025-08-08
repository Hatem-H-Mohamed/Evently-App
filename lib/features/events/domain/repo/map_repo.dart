import 'package:evently_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart' as geo;

abstract interface class MapRepo {
  Future<Either<Failure, String>> getPlaceNameFromCoordinates(
    double latitude,
    double longitude,
  );
  Future<Either<Failure, geo.Position>> getCurrentLocation();
}
