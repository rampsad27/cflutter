part of 'login_bloc_bloc.dart';

sealed class LoginBlocState extends Equatable {
  const LoginBlocState();
  
  @override
  List<Object> get props => [];
}

final class LoginBlocInitial extends LoginBlocState {}
