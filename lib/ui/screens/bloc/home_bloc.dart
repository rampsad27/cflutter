import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juneeight/di/service_locator.dart';
import 'package:juneeight/model/post_model.dart';
import 'package:juneeight/repository/home_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEventDataRequest>((event, emit) async {
      try {
        emit(state.copyWith(homeStateEnum: HomeStateEnum.loading));
        final response = await homeRepository.getHomeScreenData();
        emit(state.copyWith(
          homeStateEnum: HomeStateEnum.success,
          postModel: response,
        ));
      } catch (e) {
        state.copyWith(
          homeStateEnum: HomeStateEnum.error,
        );
      }
    });
    on<HomeEventPostRequest>((event, emit) async {
      try {
        emit(state.copyWith(homeStateEnum: HomeStateEnum.sending));
        final response = await homeRepository.addPost(event.postModel);

        emit(state.copyWith(homeStateEnum: HomeStateEnum.sent));
      } catch (e) {
        emit(
          state.copyWith(
            homeStateEnum: HomeStateEnum.error,
            errorMessage: e.toString(),
          ),
        );
      }
    });
    on<HomeEventDelete>((event, emit) async {
      try {
        emit(state.copyWith(homeStateEnum: HomeStateEnum.deleting));
        final response = await homeRepository.deletePost(event.id);

        emit(state.copyWith(homeStateEnum: HomeStateEnum.sent));
      } catch (e) {
        emit(
          state.copyWith(
            homeStateEnum: HomeStateEnum.error,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }

  final HomeRepository homeRepository = getIt.get<HomeRepository>();
}
