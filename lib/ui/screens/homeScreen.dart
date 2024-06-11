import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juneeight/model/post_model.dart';
import 'package:juneeight/repository/home_repository.dart';
import 'package:juneeight/ui/screens/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeEventDataRequest()),
      child: Scaffold(
        floatingActionButton: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                context.read<HomeBloc>().add(
                      HomeEventPostRequest(
                        postModel: const PostModel(
                          id: 2323423,
                          userId: 3434,
                          title: "title",
                          body: "body",
                        ),
                      ),
                    );
              },
              child: const Icon(Icons.add),
            );
          },
        ),
        appBar: AppBar(
          title: const Text("REST"),
        ),
        body: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.homeStateEnum == HomeStateEnum.sent &&
                state.errorMessage == "") {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Post added successfully"),
                ),
              );
            } else if (state.homeStateEnum == HomeStateEnum.deleting) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Post deleted successfully"),
                ),
              );
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            // buildWhen: (previous, current) =>
            //     current.homeStateEnum == HomeStateEnum.loading ||
            //     current.homeStateEnum == HomeStateEnum.success,
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: state.postModel?.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              trailing: IconButton(
                                onPressed: () {
                                  if (state.postModel?[index].id != null) {
                                    context.read<HomeBloc>().add(
                                          HomeEventDelete(
                                              id: state.postModel![index].id),
                                        );
                                  }
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 24,
                                  color: Color.fromARGB(255, 255, 0, 0),
                                ),
                              ),
                              title: Text(
                                  '${index + 1} ${state.postModel?[index].title ?? "chaina"}'),
                              subtitle: Text(
                                  state.postModel?[index].body ?? "ccchaina"),
                            );
                          }))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
