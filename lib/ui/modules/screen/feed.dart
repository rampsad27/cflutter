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
            postedby: "bizzle.danting",
            location: "ktm",
            likes: "347",
            comments: "62",
            caption:
                "Hello! Velit anim tempor culpa labore consectetur sit. Minim et ipsum exercitation ex Lorem id. Exercitation labore officia eiusmod elit cupidatat ut. ",
            imageUrl:
                "https://images.unsplash.com/photo-1706019175883-38f6a24730fb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMHx8fGVufDB8fHx8fA%3D%3D",
            imagecUrl:
                "https://media.architecturaldigest.com/photos/63079fc7b4858efb76814bd2/16:9/w_4000,h_2250,c_limit/9.%20DeLorean-Alpha-5%20%5BDeLorean%5D.jpg",
          ),
          PostModel(
            postedby: "user1",
            location: "New York",
            likes: "512",
            comments: "48",
            caption: "City vibes!",
            imageUrl:
                "https://images.unsplash.com/photo-1504198453319-5ce911bafcde?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4MHx8fGVufDB8fHx8fA%3D%3D",
            imagecUrl:
                "https://images.unsplash.com/photo-1706126218054-a9c83cad2d03?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8",
          ),
          PostModel(
            postedby: "beach_life",
            location: "Maldives",
            likes: "642",
            comments: "89",
            caption: "Sun, sand, and sea!",
            imageUrl:
                "https://images.unsplash.com/photo-1706126218054-a9c83cad2d03?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8",
            imagecUrl:
                "https://media.architecturaldigest.com/photos/611e1c3f49f7f58a37034cb4/16:9/w_4000,h_2250,c_limit/7-Maldives-Tropical.jpg",
          ),
          PostModel(
            postedby: "winter_wonder",
            location: "Switzerland",
            caption: "",
            likes: "421",
            comments: "55",
            imageUrl:
                "https://images.unsplash.com/photo-1480480883981-5f1f99a94782?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2Nnx8fGVufDB8fHx8fA%3D%3D",
            imagecUrl:
                "https://images.unsplash.com/photo-1706126218054-a9c83cad2d03?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8",
          ),
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
