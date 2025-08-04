import 'package:evently_app/core/error/failure.dart';
import 'package:evently_app/core/usecase/usecase.dart';
import 'package:evently_app/features/auth/domain/repo/auth_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ResetPassword implements UseCase<void, String> {
  final AuthRepo authRepo;

  ResetPassword({required this.authRepo});

  @override
  Future<Either<Failure, void>> call(S) async =>
      await authRepo.resetPassword(S);
}
