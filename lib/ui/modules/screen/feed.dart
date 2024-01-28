import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
        title: const Text(
          "Instagram",
          style: TextStyle(
            fontFamily: "S",
            fontSize: 42,
          ),
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
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
