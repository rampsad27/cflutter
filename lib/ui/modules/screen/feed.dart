import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
      body: PostsFeed(
        postModelList: [
          PostModel(
              postedby: "ram",
              likes: "735",
              comments: "643",
              imageUrl:
                  "https://images.unsplash.com/photo-1706031233608-f20f06afd09c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8fA%3D%3D"),
          PostModel(
              postedby: "sram",
              likes: "347",
              comments: "62",
              imageUrl:
                  "https://images.unsplash.com/photo-1706019175883-38f6a24730fb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMHx8fGVufDB8fHx8fA%3D%3D"),
          PostModel(
              postedby: "gram",
              likes: "457",
              comments: "6",
              imageUrl:
                  "https://images.unsplash.com/photo-1706031233608-f20f06afd09c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8fA%3D%3D"),
          PostModel(
              postedby: "jram",
              likes: "745",
              comments: "63",
              imageUrl:
                  "https://images.unsplash.com/photo-1706019175883-38f6a24730fb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMHx8fGVufDB8fHx8fA%3D%3D"),
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
