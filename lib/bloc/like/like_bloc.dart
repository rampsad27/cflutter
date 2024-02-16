import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(LikeInitial()) {
    on<LikeCountIncrementRequested>((event, emit) {
      emit(LikesCountUpdated(likesCount: event.likesCount + 1));
    });

    on<LikeCountDecrementRequested>((event, emit) {
      emit(LikesCountUpdated(likesCount: event.likesCount - 1));
    });
  }
}
