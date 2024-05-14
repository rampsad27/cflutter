part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoadInProgress extends LoginState {}

final class LoginFailure extends LoginState {
  final String message;
  const LoginFailure({required this.message});
}

final class LoginSuccess extends LoginState {
  final String message;
  const LoginSuccess({required this.message});
}

final class Authenticated extends LoginState {}

final class UnAuthenticated extends LoginState {}
