import 'package:evently_app/core/error/failure.dart';
import 'package:evently_app/core/usecase/usecase.dart';
import 'package:evently_app/features/auth/domain/repo/auth_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpEmail implements UseCase<String, SignUpEmailParams> {
  final AuthRepo authRepo;
  SignUpEmail({required this.authRepo});

  @override
  Future<Either<Failure, String>> call(SignUpEmailParams params) async =>
      await authRepo.registerWithEmailAndPassword(
        params.name,
        params.email,
        params.password,
      );
}

class SignUpEmailParams {
  final String name;
  final String email;
  final String password;

  SignUpEmailParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
