import 'package:evently_app/features/auth/domain/usecases/reset_password.dart';
import 'package:evently_app/features/auth/domain/usecases/sign_in_email.dart';
import 'package:evently_app/features/auth/domain/usecases/sign_in_google.dart';
import 'package:evently_app/features/auth/domain/usecases/sign_out.dart';
import 'package:evently_app/features/auth/domain/usecases/sign_up_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final SignInEmail signInEmail;
  final SignUpEmail signUpEmail;
  final SignInGoogle signInGoogle;
  final ResetPassword resetPassword;
  final SignOut signOut;
  AuthCubit(
    this.signOut,
    this.signInEmail,
    this.signUpEmail,
    this.signInGoogle,
    this.resetPassword,
  ) : super(AuthInitial());

  void signInwithEmail(String email, String password) async {
    emit(SignInLoading());
    final res = await signInEmail.call(
      SignInEmailParams(email: email, password: password),
    );
    res.fold(
      (failure) => emit(SignInError(message: failure.message)),
      (uid) => emit(SignInSuccess(userId: uid)),
    );
  }

  void signUpwithEmail(String name, String email, String password) async {
    emit(SignUpLoading());
    final res = await signUpEmail.call(
      SignUpEmailParams(name: name, email: email, password: password),
    );

    res.fold(
      (failure) => emit(SignUpError(message: failure.message)),
      (uid) => emit(SignUpSuccess(userId: uid)),
    );
  }

  void signInWithGoogle() async {
    emit(SignInLoading());
    final res = await signInGoogle.call(null);

    res.fold(
      (failure) => emit(SignInError(message: failure.message)),
      (uid) => emit(SignInSuccess(userId: uid)),
    );
  }

  void resetPass(String email) async {
    emit(ResetLoading());
    final res = await resetPassword.call(email);

    res.fold(
      (failure) => emit(ResetError(message: failure.message)),
      (uid) => emit(ResetSuccess()),
    );
  }

  void signUserOut() async {
    emit(SignOutLoading());
    final res = await signOut.call(null);

    res.fold(
      (failure) => emit(SignOutError(message: failure.message)),
      (uid) => emit(SignOutSuccess()),
    );
  }
}
