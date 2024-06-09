part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeEventDataRequest extends HomeEvent {}

class HomeEventPostRequest extends HomeEvent {
  final PostModel postModel;

  HomeEventPostRequest({required this.postModel});
}

class HomeEventDelete extends HomeEvent {
  final int id;

  HomeEventDelete({required this.id});
}
