part of 'book_bloc.dart';

@immutable
sealed class BookEvent {}

class ChangeLayout extends BookEvent {}
