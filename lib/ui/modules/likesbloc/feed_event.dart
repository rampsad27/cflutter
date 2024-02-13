part of 'feed_bloc.dart';

sealed class FeedEvent {}

class FeedLikeCountIncrementRequested extends FeedEvent {
  final int likesCount;
  FeedLikeCountIncrementRequested({
    required this.likesCount,
  });
  @override
  List<Object?> get props => [];
}

class FeedLikeCountDecrementRequested extends FeedEvent {
  final int likesCount;
  FeedLikeCountDecrementRequested({
    required this.likesCount,
  });
  @override
  List<Object?> get props => [];
}
