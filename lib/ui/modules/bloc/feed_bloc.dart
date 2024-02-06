import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(FeedInitial()) {
    on<FeedLikeCountIncrementRequested>((event, emit) {
      var newLike = event.likesCount + 1;
      emit(FeedLoadSuccess(likesCount: newLike));
      // emit(FeedLikeCountUpdated(likesCount: newLike));
    });
  }
  int likesCount = 123;
}
