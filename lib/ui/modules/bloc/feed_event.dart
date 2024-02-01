part of 'feed_bloc.dart';

abstract class FeedEvent extends Equatable {}

class LikesAdded extends FeedEvent {
  final int likes;
  LikesAdded({
    required this.likes,
  });
  @override
  List<Object?> get props => [];
}
