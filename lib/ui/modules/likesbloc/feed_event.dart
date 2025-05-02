part of 'feed_bloc.dart';

abstract class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

class FeedLikeCountIncrementRequested extends FeedEvent {
  final int postIndex;
  final int likesCount;

  const FeedLikeCountIncrementRequested(
      {required this.postIndex, required this.likesCount});

  @override
  List<Object> get props => [postIndex, likesCount];
}

class FeedLikeCountDecrementRequested extends FeedEvent {
  final int postIndex;
  final int likesCount;

  const FeedLikeCountDecrementRequested(
      {required this.postIndex, required this.likesCount});

  @override
  List<Object> get props => [postIndex, likesCount];
}
