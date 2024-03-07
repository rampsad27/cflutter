import 'package:extraaa/ui/modules/bloc/book_bloc.dart';
import 'package:extraaa/ui/modules/screen/Gridview.dart';
import 'package:extraaa/ui/modules/screen/Listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookList extends StatefulWidget {
  final Function(bool isSelected)? onSelectionChanged;
  const BookList({super.key, this.onSelectionChanged});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewBloc, ViewState>(
      builder: (context, state) {
        if (state is ListViewState) {
          return ListViewShow(
            onSelectionChanged: widget.onSelectionChanged,
          );
        } else if (state is GridViewState) {
          return GridViewShow(
            onSelectionChanged: widget.onSelectionChanged,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
