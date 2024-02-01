part of 'feed_bloc.dart';

abstract class FeedState extends Equatable {
  // const FeedState();
}

class FeedStateInitial extends FeedState {
  @override
  List<Object?> get props => [];
}

class FeedStateLikesChanged extends FeedState {
  final int likes;
  FeedStateLikesChanged({
    required this.likes,
  });
  @override
  List<Object?> get props => [likes];
}
