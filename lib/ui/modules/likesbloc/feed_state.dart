part of 'feed_bloc.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class FeedInitial extends FeedState {}

class FeedLikeCountUpdated extends FeedState {
  final int postIndex;
  final int likesCount;

  const FeedLikeCountUpdated(
      {required this.postIndex, required this.likesCount});

  @override
  List<Object> get props => [postIndex, likesCount];
}

class FeedLoadSuccess extends FeedState {
  final int postIndex;
  final int likesCount;

  const FeedLoadSuccess({required this.postIndex, required this.likesCount});

  @override
  List<Object> get props => [postIndex, likesCount];
}
