// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'book_event.dart';
// part 'book_state.dart';

// class BookBloc extends Bloc<BookEvent, BookState> {
//   BookBloc() : super(BookInitial()) {
//     on<ChangeLayout>((event, emit) {
//       if (state is ListViewState) {
//         emit(GridViewState());
//       } else {
//         emit(ListViewState());
//       }
//     });
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
part 'book_event.dart';
part 'book_state.dart';

class ViewBloc extends Bloc<ViewEvent, ViewState> {
  ViewBloc() : super(ListViewState()) {
    on<ToggleViewEvent>((event, emit) {
      if (state is ListViewState) {
        emit(ListViewState());
      } else {
        emit(GridViewState());
      }
    });
  }
}
