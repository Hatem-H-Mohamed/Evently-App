import 'package:evently_app/core/error/failure.dart';
import 'package:evently_app/core/usecase/usecase.dart';
import 'package:evently_app/features/events/domain/repo/map_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPlaceNameUsecase implements UseCase<String, LocationParams> {
  final MapRepo mapRepo;
  GetPlaceNameUsecase({required this.mapRepo});

  @override
  Future<Either<Failure, String>> call(LocationParams params) async {
    return mapRepo.getPlaceNameFromCoordinates(
      params.latitude,
      params.longitude,
    );
  }
}

class LocationParams {
  final double latitude;
  final double longitude;

  LocationParams({required this.latitude, required this.longitude});
}
