import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(FeedStateInitial()) {
    on<LikesAdded>((event, emit) {
      var newLike = event.likes + 1;
      emit(FeedStateLikesChanged(likes: newLike));
    });
  }
  int likes = 100;
}
