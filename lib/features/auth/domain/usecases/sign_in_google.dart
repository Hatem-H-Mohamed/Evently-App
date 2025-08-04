import 'package:evently_app/core/error/failure.dart';
import 'package:evently_app/core/usecase/usecase.dart';
import 'package:evently_app/features/auth/domain/repo/auth_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInGoogle implements UseCase<String, void> {
  final AuthRepo authRepo;
  SignInGoogle({required this.authRepo});

  @override
  Future<Either<Failure, String>> call(_) async =>
      await authRepo.signInWithGoogle();
}
