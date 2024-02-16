part of 'details_bloc.dart';

@immutable
sealed class DetailsEvent {}

class DetailsSaveRequested extends DetailsEvent {
  final String name;
  final String username;
  final String bio;

  DetailsSaveRequested(this.name, this.username, this.bio);
}

class DetailsLoadRequested extends DetailsEvent {}
