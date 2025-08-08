import 'package:evently_app/core/error/failure.dart';
import 'package:evently_app/core/usecase/usecase.dart';
import 'package:evently_app/features/events/domain/repo/map_repo.dart';
import 'package:fpdart/fpdart.dart';

import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCurrentLocationUsecase implements UseCase<Position, void> {
  final MapRepo mapRepo;
  GetCurrentLocationUsecase({required this.mapRepo});
  @override
  Future<Either<Failure, Position>> call(void params) async {
    return await mapRepo.getCurrentLocation();
  }
}
