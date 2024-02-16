// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'like_bloc.dart';

sealed class LikeEvent {}

class LikeCountIncrementRequested extends LikeEvent {
  final int likesCount;
  LikeCountIncrementRequested({
    required this.likesCount,
  });
}

class LikeCountDecrementRequested extends LikeEvent {
  final int likesCount;
  LikeCountDecrementRequested({
    required this.likesCount,
  });
}
