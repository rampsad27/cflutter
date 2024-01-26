// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ig/ui/modules/screen/story.dart';
import 'package:ig/ui/modules/widgets/story_design.dart';
// import 'package:ig/ui/modules/widgets/line.dart';

class PostsFeed extends StatefulWidget {
  const PostsFeed({super.key, required this.postModelList});
  final List<PostModel> postModelList;
  @override
  State<PostsFeed> createState() => _PostsFeedState();
}

class _PostsFeedState extends State<PostsFeed> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 90,
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
                  child: const Storydesign(),
                );
              },
            ),
          ),
        ),
        // posts
        SliverList.builder(
          itemCount: widget.postModelList.length,
          itemBuilder: (context, index) {
            return Container(
              height: 600,
              margin: const EdgeInsets.only(bottom: 10),
              // color: const Color.fromARGB(255, 131, 170, 224),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                              widget.postModelList[index].imagecUrl),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.postModelList[index].postedby,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.postModelList[index].location,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            // const Text(
                            //   "Sound Text",
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //     color: Colors.grey,
                            //   ),
                            // ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.more_horiz_outlined),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Image.network(
                      widget.postModelList[index].imageUrl,
                      width: double.infinity,
                      // height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // const SizedBox(height: 10),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(CupertinoIcons.heart),
                            SizedBox(width: 8),
                            Icon(Icons.comment_outlined),
                            SizedBox(width: 8),
                            Icon(Icons.send),
                            Spacer(),
                            Icon(Icons.bookmark_border_outlined),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          " ${widget.postModelList[index].likes} likes",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.postModelList[index].postedby,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.postModelList[index].caption,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          " View all ${widget.postModelList[index].comments} comments",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 156, 156, 156),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class PostModel {
  final String postedby;
  final String location;
  final String likes;
  final String caption;
  final String comments;
  final String imageUrl;
  final String imagecUrl;

  PostModel({
    required this.postedby,
    required this.location,
    required this.likes,
    required this.caption,
    required this.comments,
    required this.imageUrl,
    required this.imagecUrl,
  });
}
