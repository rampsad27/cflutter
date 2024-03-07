import 'package:extraaa/ui/modules/bloc/book_bloc.dart';
import 'package:extraaa/ui/modules/screen/booklist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isPressed = false;
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
            Expanded(
              child: BookList(
                onSelectionChanged: (isSelected) {
                  setState(() {
                    _isPressed = isSelected;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(32),
                  color: _isPressed ? Colors.blue : Colors.grey,
                ),
                width: double.infinity,
                height: 40,
                child: const Center(child: Text("Continue")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
