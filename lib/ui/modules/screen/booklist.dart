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
    // return GridView.builder(
    //   shrinkWrap: true, // Limit the grid
    //   physics: const NeverScrollableScrollPhysics(), // Disables scrolling
    //   itemCount: 9, // Total number of items
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 3,
    //     crossAxisSpacing: 4.0,
    //     mainAxisSpacing: 4.0,
    //   ),
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       color: Colors.teal,
    //       child: Text(
    //         'Item $index',
    //         style: const TextStyle(fontSize: 16),
    //       ),
    //     );
    //   },
    // );
    return ListView.builder(
        shrinkWrap: true, // Limit the grid
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 283,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 20,
                color: Colors.green,
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          );
        });
  }
}
