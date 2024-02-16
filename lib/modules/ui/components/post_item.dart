import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_app/bloc/like/like_bloc.dart';
import 'package:instagram_app/extension/int_extension.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/models/post_model.dart';
import 'package:instagram_app/modules/ui/likes/likesbloc/feed_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';

class PostItem extends StatefulWidget {
  PostModel post;
  final void Function(PostModel, bool) onLikePressed;
  PostItem({
    Key? key,
    required this.post,
    required this.onLikePressed,
  }) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserDetailsWidget(post: widget.post),
        Image.network(widget.post.imageUrl),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<FeedBloc, FeedState>(
              builder: (context, state) {
                return IconButton(
                  icon: widget.post.isLiked
                      ? const Icon(Icons.favorite, color: Colors.red)
                      : const Icon(Icons.favorite_border),
                  onPressed: () {
                    setState(() {
                      widget.post = widget.post.copyWith(
                        isLiked: !widget.post.isLiked,
                      );
                      //unliked
                      if (widget.post.isLiked) {
                        widget.post = widget.post.copyWith();
                        BlocProvider.of<FeedBloc>(context).add(
                          FeedLikeCountIncrementRequested(
                            likesCount: widget.post.likeCount,
                          ),
                        );
                      } else {
                        widget.post = widget.post.copyWith();
                        BlocProvider.of<FeedBloc>(context).add(
                          FeedLikeCountDecrementRequested(
                            likesCount: widget.post.likeCount,
                          ),
                        );
                      }
                    });
                  },
                );
              },
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/vectors/instagram-comment-icon.svg',
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                height: 20,
              ),
            ),
            IconButton(
              onPressed: () {
                Share.share('check out my website http://temcop.sj/ukufen');
              },
              icon: SvgPicture.asset(
                'assets/icons/vectors/paper-plane.svg',
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                height: 20,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/vectors/bookmark-regular.svg',
                height: 20,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<FeedBloc, FeedState>(
              builder: (context, state) {
                if (state is FeedLoadSuccess) {
                  return Text(
                    "${state.likesCount} likes",
                    style: const TextStyle(color: Colors.white),
                  );
                } else {
                  return Text("${widget.post.likeCount} likes",
                      style: const TextStyle(color: Colors.white));
                }
              },
            ),
            const SizedBox(width: 4),
            Expanded(
              child: ReadMoreText(
                widget.post.caption,
                style: const TextStyle(color: Colors.white),
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'more',
                trimExpandedText: 'less',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class UserDetailsWidget extends StatelessWidget {
  UserDetailsWidget({
    super.key,
    required this.post,
  });

  PostModel post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 0, 4),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(post.pprofileImage),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    post.username,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  if (post.isVerified)
                    SvgPicture.asset(
                      'assets/icons/vectors/instagram-verified.svg',
                      height: 16,
                    )
                ],
              ),
              const Text(
                "Sponsored",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
