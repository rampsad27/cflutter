import 'package:extraaa/ui/modules/book_list_data.dart';
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
      itemCount: 98,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.teal,
          child: Text(
            'Item $index',
            style: const TextStyle(fontSize: 16),
          ),
        );
      },
    );
    // return ListView.builder(
    //   itemCount: 23,
    //   itemBuilder: (context, index) {
    //     return Column(
    //       children: [
    //         Container(
    //           height: 100,
    //           color: Colors.green,
    //           child: Center(
    //             child: Text(
    //               'Book $index',
    //               style: const TextStyle(color: Colors.white, fontSize: 20),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height: 12),
    //       ],
    //     );
    //   },
    // );
  }
}
