import 'package:extraaa/ui/modules/screen/Gridview.dart';
import 'package:extraaa/ui/modules/screen/Listview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'book_event.dart';
part 'book_state.dart';

class ViewBloc extends Bloc<ViewEvent, ViewState> {
  ViewBloc() : super(GridViewState()) {
    on<LayoutViewEvent>((event, emit) {
      if (state is ListViewState) {
        emit(GridViewState());
      } else {
        emit(ListViewState());
      }
    });
  }
}
