import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:counter/ui/modules/add_books_distributed/models/book_model.dart';
import 'package:counter/ui/modules/add_books_distributed/models/name_data.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'book_distributed_event.dart';
part 'book_distributed_state.dart';

class BookDistributedBloc
    extends Bloc<BookDistributedEvent, BookDistributedState> {
  BookDistributedBloc() : super(BookDistributedInitial()) {
    on<BookDistributedDataRequested>((event, emit) async {
      emit(BookDistributedLoadInProgress());
      await Future.delayed(const Duration(seconds: 2));

      emit(BookDistributedSuccess(
        bookModelList: nameData,
        total: calculateTotal(nameData),
      ));
    });

    on<AddCounterPressed>((event, emit) {
      emit(BookDistributedInitial());
      try {
        var temp = event.bookModelList;
        var item = temp[event.index];
        item = item.copyWith(
          quantity: item.quantity + 1,
        );
        temp[event.index] = item;

        emit(BookDistributedSuccess(
          bookModelList: temp,
          total: calculateTotal(temp),
        ));
      } catch (e) {
        log(e.toString());
      }
    });

    on<SubtractCounterPressed>((event, emit) {
      emit(BookDistributedInitial());
      try {
        var temp = event.bookModelList;
        var item = temp[event.index];
        if (item.quantity > 0) {
          item = item.copyWith(
            quantity: item.quantity - 1,
          );
          temp[event.index] = item;
        }

        emit(BookDistributedSuccess(
          bookModelList: temp,
          total: calculateTotal(temp),
        ));
      } catch (e) {
        log(e.toString());
      }
    });
    on<UpdateQuantity>((event, emit) {
      var currentState = state;
      if (currentState is BookDistributedSuccess) {
        var updatedList = List<BookModel>.from(currentState.bookModelList);
        updatedList[event.index] =
            updatedList[event.index].copyWith(quantity: event.newQuantity);

        emit(BookDistributedSuccess(
          bookModelList: updatedList,
          total: calculateTotal(updatedList),
        ));
      }
    });
  }

  int calculateTotal(List<BookModel> listItem) {
    var total = 0;
    for (var element in listItem) {
      total += element.quantity;
    }
    return total;
  }
}
