part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignUpLoading extends AuthState {}

final class ResetLoading extends AuthState {}

final class SignOutLoading extends AuthState {}

final class SignOutSuccess extends AuthState {}

final class ResetSuccess extends AuthState {}

final class SignUpSuccess extends AuthState {
  final String userId;
  SignUpSuccess({required this.userId});
}

final class SignInSuccess extends AuthState {
  final String userId;
  SignInSuccess({required this.userId});
}

final class SignUpError extends AuthState {
  final String message;
  SignUpError({required this.message});
}

final class SignInError extends AuthState {
  final String message;
  SignInError({required this.message});
}

final class ResetError extends AuthState {
  final String message;
  ResetError({required this.message});
}

final class SignOutError extends AuthState {
  final String message;
  SignOutError({required this.message});
}
