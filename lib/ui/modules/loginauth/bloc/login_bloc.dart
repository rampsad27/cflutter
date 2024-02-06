import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
  }
}
