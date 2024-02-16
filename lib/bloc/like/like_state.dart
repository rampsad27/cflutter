part of 'like_bloc.dart';

abstract class LikeState extends Equatable {}

final class LikeInitial extends LikeState {
  @override
  List<Object?> get props => [];
}

final class LikeLoadSuccess extends LikeState {
  final int likesCount;

  LikeLoadSuccess({required this.likesCount});

  @override
  List<Object?> get props => [likesCount];
}

final class LikesCountUpdated extends LikeState {
  final int likesCount;

  LikesCountUpdated({required this.likesCount});

  @override
  List<Object?> get props => [likesCount];
}
