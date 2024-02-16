import 'package:flutter/material.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Limit the grid
      physics: const NeverScrollableScrollPhysics(), // Disables scrolling
      itemCount: 9, // Total number of items
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          color: Colors.teal,
          child: Text(
            'Item $index',
            style: const TextStyle(fontSize: 16),
          ),
        );
      },
    );
  }
}
