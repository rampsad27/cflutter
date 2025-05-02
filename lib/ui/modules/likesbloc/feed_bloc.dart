import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(FeedInitial()) {
    on<FeedLikeCountIncrementRequested>((event, emit) {
      var newLikeCount = event.likesCount + 1;
      emit(FeedLikeCountUpdated(
          postIndex: event.postIndex, likesCount: newLikeCount));
      emit(FeedLoadSuccess(
          postIndex: event.postIndex, likesCount: newLikeCount));
    });
    on<FeedLikeCountDecrementRequested>((event, emit) {
      var newLikeCount = event.likesCount;
      emit(FeedLikeCountUpdated(
          postIndex: event.postIndex, likesCount: newLikeCount));
      emit(FeedLoadSuccess(
          postIndex: event.postIndex, likesCount: newLikeCount));
    });
  }
}
