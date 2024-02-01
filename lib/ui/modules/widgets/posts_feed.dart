import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ig/ui/modules/bloc/feed_bloc.dart';
import 'package:ig/ui/modules/widgets/bottomsheet.dart';
import 'package:readmore/readmore.dart';
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
    // return BlocBuilder<FeedBloc, FeedState>(
    //   builder: (context, state) {
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
              height: 610,
              margin: const EdgeInsets.only(bottom: 20),
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
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return const MyBottomSheet();
                              },
                            );
                          },
                          child: const Icon(Icons.more_horiz_outlined),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Image.network(
                      widget.postModelList[index].imageUrl,
                      width: double.infinity,
                      // height: 300,
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
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(CupertinoIcons.heart),
                              onPressed: () {
                                // BlocProvider.of<FeedBloc>(context)
                                //     .add(LikesAdded());
                              },
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Icons.comment_outlined),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: () {},
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.bookmark_border_outlined),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "h",
                          // "${state.likes} likes",
                          // state is FeedStateLikesChanged
                          //     ? "${state.likes}"
                          // " ${widget.postModelList[index].likes} likes",
                          //     : "0",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          widget.postModelList[index].postedby,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const WidgetSpan(
                                      child: SizedBox(width: 10),
                                    ),
                                    WidgetSpan(
                                      child: ReadMoreText(
                                        widget.postModelList[index].caption,
                                        trimLines: 2,
                                        colorClickableText: Colors.pink,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: ' more',
                                        trimExpandedText: ' less',
                                        moreStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        lessStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
    //   },
    // );
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
