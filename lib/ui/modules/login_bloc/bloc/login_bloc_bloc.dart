import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc() : super(LoginBlocInitial()) {
    on<LoginBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
