part of 'login_bloc.dart';

@immutable
sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoadInProgress extends LoginState {}

final class LoginFailure extends LoginState {
  final String loginErrorMessage;

  LoginFailure({required this.loginErrorMessage});

  @override
  List<Object?> get props => [loginErrorMessage];
}

final class LoginSuccess extends LoginState {
  final String loginSuccessMessage;

  LoginSuccess({required this.loginSuccessMessage});

  @override
  List<Object?> get props => [loginSuccessMessage];
}

final class LoginAuthenticated extends LoginState {}

final class LoginUnAuthenticated extends LoginState {}
