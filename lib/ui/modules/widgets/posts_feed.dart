import 'package:flutter/material.dart';
import 'package:ig/ui/modules/screen/story.dart';
// import 'package:ig/ui/modules/widgets/line.dart';

class PostsFeed extends StatefulWidget {
  const PostsFeed({super.key});

  @override
  State<PostsFeed> createState() => _PostsFeedState();
}

class _PostsFeedState extends State<PostsFeed> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 69,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const StoryScreen()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color.fromARGB(255, 230, 172, 110),
                  ),
                ),
              );
            },
          ),
        ),
        // const HorizontalLineWithText(),
        Expanded(
          child: ListView.builder(
            itemCount: 69,
            itemBuilder: (context, index) {
              return Container(
                height: 300,
                margin: const EdgeInsets.only(bottom: 30),
                color: const Color.fromARGB(255, 47, 122, 226),
              );
            },
          ),
        ),
      ],
    );
  }
}
