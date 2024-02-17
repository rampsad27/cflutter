import 'package:extraaa/ui/modules/bloc/book_bloc.dart';
import 'package:extraaa/ui/modules/screen/booklist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Add Book"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                const Text("All"),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_drop_down),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    context.read<ViewBloc>().add(LayoutViewEvent());
                  },
                  icon: const Icon(Icons.list),
                )
              ],
            ),
            const Expanded(child: BookList()),
          ],
        ),
      ),
    );
  }
}
