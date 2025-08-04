import 'package:evently_app/core/error/failure.dart';
import 'package:evently_app/core/usecase/usecase.dart';
import 'package:evently_app/features/auth/domain/repo/auth_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInEmail implements UseCase<String, SignInEmailParams> {
  final AuthRepo authRepo;
  SignInEmail({required this.authRepo});

  @override
  Future<Either<Failure, String>> call(SignInEmailParams params) async =>
      await authRepo.signInWithEmailAndPassword(params.email, params.password);
}

class SignInEmailParams {
  final String email;
  final String password;

  SignInEmailParams({required this.email, required this.password});
}
