import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ig/configs/app_theme.dart';
import 'package:ig/ui/common_blocs/bloc/theme_bloc.dart';
import 'package:ig/ui/data/feed_data.dart';
import 'package:ig/ui/modules/widgets/bottom_navigation.dart';
import 'package:ig/ui/modules/widgets/posts_feed.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "Instagram",
              style: TextStyle(
                fontFamily: "S",
                fontSize: 42,
              ),
            ),
            const SizedBox(width: 22),
            Container(
              color: const Color.fromARGB(255, 110, 110, 110),
              height: 40,
              width: 97,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<ThemeBloc>().add(
                          ThemeChangeRequested(themeData: AppTheme.lightTheme));
                    },
                    icon: const Icon(
                      Icons.sunny,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<ThemeBloc>().add(
                          ThemeChangeRequested(themeData: AppTheme.darkTheme));
                    },
                    icon: const Icon(
                      Icons.nightlight_round_outlined,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.heart,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.messenger),
          ),
        ],
      ),
      body: PostsFeed(postModelList: feedData),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
