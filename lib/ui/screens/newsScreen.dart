import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juneeight/model/news_model.dart';
import 'package:juneeight/ui/screens/bloc/news_bloc.dart';
import 'package:juneeight/ui/screens/bloc/news_state.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc()..add(NewsEventDataRequest()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News"),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          // buildWhen: (previous, current) =>
          //     current.homeStateEnum == HomeStateEnum.loading ||
          //     current.homeStateEnum == HomeStateEnum.success,
          builder: (context, state) {
            if (state.newsStateEnum == NewsStateEnum.success) {
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: state.newsModel?.articles?.length ?? 0,
                itemBuilder: (context, index) {
                  final articles = state.newsModel?.articles?[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.all(8),
                    title: Text(articles?.title ?? 'No Title'),
                    // subtitle: Text(articles.description ?? 'No Description'),
                    onTap: () {
                      // Handle tap on article
                    },
                  );
                },
              );
            } else if (state.newsStateEnum == NewsStateEnum.error) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return const Center(child: Text("circular"));
            }
          },
        ),
      ),
    );
  }
}
