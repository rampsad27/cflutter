import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ig/ui/modules/components/model.dart';
import 'package:ig/ui/modules/likesbloc/feed_bloc.dart';
import 'package:ig/ui/modules/widgets/bottomsheet.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:readmore/readmore.dart';
import 'package:ig/ui/modules/screen/story.dart';
import 'package:ig/ui/modules/widgets/story_design.dart';
import 'package:share_plus/share_plus.dart';

class PostsFeed extends StatefulWidget {
  const PostsFeed({super.key, required this.postModelList});
  final List<PostModel> postModelList;
  @override
  State<PostsFeed> createState() => _PostsFeedState();
}

class _PostsFeedState extends State<PostsFeed> {
  bool isLiked = false;
  int selectedIndex = -1;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));

    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: CustomScrollView(
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

                  child: BlocProvider(
                    create: (context) => FeedBloc(),
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
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  BlocBuilder<FeedBloc, FeedState>(
                                    builder: (context, state) {
                                      return IconButton(
                                        icon: isLiked
                                            ? const Icon(Icons.favorite)
                                            : const Icon(Icons.favorite_border),
                                        color: isLiked ? Colors.red : null,
                                        onPressed: () {
                                          setState(() {
                                            isLiked = !isLiked;
                                          });
                                          BlocProvider.of<FeedBloc>(context).add(
                                              FeedLikeCountIncrementRequested(
                                            likesCount: state is FeedLoadSuccess
                                                ? state.likesCount
                                                : widget
                                                    .postModelList[index].likes,
                                          ));
                                        },
                                        // icon: const Icon(
                                        //     Icons.favorite_border_outlined),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.comment_outlined),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.send),
                                    onPressed: () {
                                      Share.share("send in messenger");
                                    },
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(
                                        Icons.bookmark_border_outlined),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              BlocBuilder<FeedBloc, FeedState>(
                                // buildWhen: (previous, current) =>
                                //     current is FeedFailure,
                                builder: (context, state) {
                                  if (state is FeedLoadSuccess) {
                                    return Text("${state.likesCount} likes");
                                  } else {
                                    return Text(
                                        "${widget.postModelList[index].likes} likes");
                                    // const Text("h likes");
                                    // style: TextStyle(
                                    //   fontSize: 11,
                                    //   fontWeight: FontWeight.bold,
                                    // ),
                                  }
                                },
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.postModelList[index].postedby,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: ReadMoreText(
                                      widget.postModelList[index].caption,
                                      trimLines: 2,
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
                  ));
            },
          ),
        ],
      ),
    );
  }
}
