import 'package:counter/ui/modules/add_books_distributed/bloc/book_distributed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDistributedBooksPage extends StatefulWidget {
  const AddDistributedBooksPage({super.key});

  @override
  State<AddDistributedBooksPage> createState() =>
      _AddDistributedBooksPageState();
}

class _AddDistributedBooksPageState extends State<AddDistributedBooksPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookDistributedBloc()..add(BookDistributedDataRequested()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 234, 232, 232),
          title: const Text("Add Books Distributed"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: const [Icon(Icons.search)],
        ),
        body: BlocBuilder<BookDistributedBloc, BookDistributedState>(
          builder: (context, state) {
            if (state is BookDistributedLoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is BookDistributedSuccess) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Book",
                          style: TextStyle(
                            color: Color.fromARGB(255, 88, 88, 88),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Quantity",
                          style: TextStyle(
                            color: Color.fromARGB(255, 88, 88, 88),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 206, 206, 206),
                      height: 1.0,
                      thickness: 1.0,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.bookModelList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                state.bookModelList[index].code,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 68.0),
                              Text(state.bookModelList[index].title),
                              const SizedBox(width: 34.0),
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: state.bookModelList[index].quantity >
                                        0
                                    ? () {
                                        context.read<BookDistributedBloc>().add(
                                              SubtractCounterPressed(
                                                bookModelList:
                                                    state.bookModelList,
                                                index: index,
                                              ),
                                            );
                                      }
                                    : null,
                              ),
                              Text(
                                state.bookModelList[index].quantity.toString(),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  context.read<BookDistributedBloc>().add(
                                        AddCounterPressed(
                                          bookModelList: state.bookModelList,
                                          index: index,
                                        ),
                                      );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text("Total Megabook Distributed"),
                            const Spacer(),
                            Text(state.total.toString()),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  state.total >= 1 ? Colors.pink : Colors.grey,
                            ),
                            child: const Text('Add'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
