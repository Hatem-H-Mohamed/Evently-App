import 'package:evently_app/core/error/failure.dart';
import 'package:evently_app/features/auth/data/data_source/auth_remote.dart';
import 'package:evently_app/features/auth/domain/repo/auth_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemote authRemote;
  AuthRepoImpl({required this.authRemote});

  @override
  Future<Either<Failure, String>> registerWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      final result = await authRemote.registerWithEmailAndPassword(
        name,
        email,
        password,
      );
      return right(result);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result = await authRemote.signInWithEmailAndPassword(
        email,
        password,
      );
      return right(result);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> signInWithGoogle() async {
    try {
      await authRemote.signInWithGoogle();
      return right('Sign in successful');
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> signOut() async {
    try {
      authRemote.signOut();
      return right('Sign out successful');
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      return right(await authRemote.resetPassword(email));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
