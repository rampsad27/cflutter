import 'package:counter/ui/modules/add_books_distributed/add_book_distributed_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AddDistributedBooksPage(),
    );
  }
}
