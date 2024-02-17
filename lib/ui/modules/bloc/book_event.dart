part of 'book_bloc.dart';

// @immutable
// sealed class BookEvent {}

// class ChangeLayout extends BookEvent {}
abstract class ViewEvent {}

class ToggleViewEvent extends ViewEvent {}
