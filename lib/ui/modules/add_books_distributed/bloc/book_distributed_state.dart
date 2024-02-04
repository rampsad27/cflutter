part of 'book_distributed_bloc.dart';

@immutable
sealed class BookDistributedState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class BookDistributedInitial extends BookDistributedState {}

final class BookDistributedLoadInProgress extends BookDistributedState {}

final class BookDistributedFailure extends BookDistributedState {}

final class BookDistributedSuccess extends BookDistributedState {
  final List<BookModel> bookModelList;

  final int total;

  BookDistributedSuccess({required this.bookModelList, required this.total});

  @override
  List<Object?> get props => [bookModelList];
}
