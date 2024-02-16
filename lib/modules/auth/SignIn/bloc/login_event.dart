part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginAuthRequested extends LoginEvent {
  final String username;
  final String password;

  LoginAuthRequested({required this.username, required this.password});
}

final class LoginCheckRequested extends LoginEvent {}

final class LoginLogoutRequested extends LoginEvent {}
