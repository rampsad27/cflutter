part of 'feed_bloc.dart';

abstract class FeedState extends Equatable {
  // const FeedState();
}

final class FeedInitial extends FeedState {
  @override
  List<Object?> get props => [];
}

final class FeedLoadInProgress extends FeedState {
  @override
  List<Object?> get props => [];
}

final class FeedFailure extends FeedState {
  final String message;
  FeedFailure({required this.message});

  @override
  List<Object?> get props => [];
}

final class FeedLoadSuccess extends FeedState {
  final int likesCount;
  FeedLoadSuccess({
    required this.likesCount,
  });
  @override
  List<Object?> get props => [likesCount];
}

// class FeedLikeCountUpdated extends FeedState {
//   final int likesCount;

//   FeedLikeCountUpdated({required this.likesCount});

//   @override
//   List<Object?> get props => [likesCount];
// }
