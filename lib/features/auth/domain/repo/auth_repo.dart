import 'package:evently_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, String>> signInWithGoogle();
  Future<Either<Failure, String>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failure, String>> registerWithEmailAndPassword(
    String name,
    String email,
    String password,
  );
  Future<Either<Failure, String>> signOut();

  Future<Either<Failure, void>> resetPassword(String email);
}
