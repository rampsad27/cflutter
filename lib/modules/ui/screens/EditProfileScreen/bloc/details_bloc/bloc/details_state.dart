part of 'details_bloc.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

final class DetailsInitial extends DetailsState {}

final class DetailsLoadInProgress extends DetailsState {}

final class DetailsLoadFailure extends DetailsState {
  final String failureMessage;

  const DetailsLoadFailure({required this.failureMessage});

  @override
  List<Object> get props => [failureMessage];
}

final class DetailsLoadSuccess extends DetailsState {
  final String successMessage;

  const DetailsLoadSuccess({required this.successMessage});

  @override
  List<Object> get props => [successMessage];
}

final class DetailsLoaded extends DetailsState {
  final DetailModel userDetails;

  const DetailsLoaded(this.userDetails);

  @override
  List<Object> get props => [userDetails];
}
