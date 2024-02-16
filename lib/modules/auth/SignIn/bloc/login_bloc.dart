import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instagram_app/modules/auth/SignIn/repository/login_auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.loginAuthenticationRepository})
      : super(LoginInitial()) {
    on<LoginAuthRequested>((event, emit) async {
      emit(LoginLoadInProgress());

      await Future.delayed(const Duration(seconds: 2));

      await loginAuthenticationRepository.saveLoginInfo(
          event.username, event.password);

      emit(LoginSuccess(loginSuccessMessage: "Logged in successfully"));

      emit(LoginFailure(loginErrorMessage: "Login Faiuled"));
    });

    on<LoginCheckRequested>((event, emit) async {
      emit(LoginLoadInProgress());
      await Future.delayed(const Duration(seconds: 2));

      final userInfo = loginAuthenticationRepository.getLoginInfo();

      if (userInfo.username.isNotEmpty) {
        emit(LoginAuthenticated());
      } else {
        emit(LoginUnAuthenticated());
      }
    });

    on<LoginLogoutRequested>((event, emit) async {
      emit(LoginLoadInProgress());
      await Future.delayed(const Duration(seconds: 2));

      final userInfo = await loginAuthenticationRepository.logout();

      if (userInfo != null && userInfo == true) {
        emit(LoginUnAuthenticated());
      } else {
        emit(LoginAuthenticated());
      }
    });
  }

  LoginAuthenticationRepository loginAuthenticationRepository;
}
