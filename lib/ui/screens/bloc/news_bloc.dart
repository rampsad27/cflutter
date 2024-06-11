import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:juneeight/di/service_locator.dart';
import 'package:juneeight/model/news_model.dart';
import 'package:juneeight/repository/news_repository.dart';
import 'package:juneeight/ui/screens/bloc/news_state.dart';

part 'news_event.dart';
// part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(const NewsState()) {
    on<NewsEventDataRequest>((event, emit) async {
      try {
        emit(state.copyWith(newsStateEnum: NewsStateEnum.loading));
        final response = await newsRepository.getNewsScreenData();
        emit(state.copyWith(
          newsStateEnum: NewsStateEnum.success,
          newsModel: response,
        ));
      } catch (e) {
        state.copyWith(
          newsStateEnum: NewsStateEnum.error,
        );
      }
    });
  }

  final NewsRepository newsRepository = getIt.get<NewsRepository>();
}
