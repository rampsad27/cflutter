part of 'book_bloc.dart';

// @immutable
// sealed class BookState {}

// final class BookInitial extends BookState {}

// class ChangeLayout extends BookState {
//    final bool isListView;

//  BookState(this.isListView);}

// class ListViewState extends BookState {}

// class GridViewState extends BookState {}
abstract class ViewState {}

class ListViewState extends ViewState {}

class GridViewState extends ViewState {}
