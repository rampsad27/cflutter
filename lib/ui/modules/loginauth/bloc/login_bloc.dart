import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ig/ui/modules/loginauth/repository/authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository authenticationRepository;

  LoginBloc({required this.authenticationRepository}) : super(LoginInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(LoginLoadInProgress());
      await Future.delayed(const Duration(seconds: 2));
      await authenticationRepository.saveUserInfo(event.email, event.password);
      emit(const LoginSuccess(message: "bhayo"));
    });
    on<CheckLoggedInUser>((event, emit) async {
      emit(LoginLoadInProgress());
      await Future.delayed(const Duration(seconds: 2));
      // bool isLoggedIn = await authenticationRepository.isUserLoggedIn();
      final userInfo = authenticationRepository.getUserInfo();
      if (userInfo.email.isNotEmpty) {
        emit(Authenticated());
      } else {
        emit(UnAuthenticated());
      }
    });
    on<LogInLogOutRequested>((event, emit) async {
      emit(LoginLoadInProgress());
      await Future.delayed(const Duration(seconds: 2));

      final result = await authenticationRepository.logout();
      if (result != null && result == true) {
        emit(UnAuthenticated());
      } else {
        emit(Authenticated());
      }
    });
  }
}
