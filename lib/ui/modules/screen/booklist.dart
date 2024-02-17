import 'package:extraaa/ui/modules/bloc/book_bloc.dart';
import 'package:extraaa/ui/modules/screen/Gridview.dart';
import 'package:extraaa/ui/modules/screen/Listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewBloc, ViewState>(
      builder: (context, state) {
        if (state is ListViewState) {
          return const ListViewShow();
        } else if (state is GridViewState) {
          return const GridViewShow();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
