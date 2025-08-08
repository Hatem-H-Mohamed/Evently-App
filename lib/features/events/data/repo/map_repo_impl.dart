import 'package:evently_app/core/error/failure.dart';
import 'package:evently_app/features/events/data/datasource/maps_remote.dart';
import 'package:evently_app/features/events/domain/repo/map_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:injectable/injectable.dart';

@LazySingleton(as: MapRepo)
class MapRepoImpl implements MapRepo {
  final MapsRemote mapsRemoteImpl;
  MapRepoImpl({required this.mapsRemoteImpl});

  @override
  Future<Either<Failure, geo.Position>> getCurrentLocation() async {
    try {
      final result = await mapsRemoteImpl.getCurrentLocation();
      return right(result);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getPlaceNameFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      final result = await mapsRemoteImpl.getPlaceNameFromCoordinates(
        latitude,
        longitude,
      );
      return right(result);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
