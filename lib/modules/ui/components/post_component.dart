import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_app/bloc/like/like_bloc.dart';
import 'package:instagram_app/data/home_screen_data.dart';
import 'package:instagram_app/modules/ui/components/post_item.dart';

class PostComponent extends StatefulWidget {
  const PostComponent({super.key});

  @override
  State<PostComponent> createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          const SizedBox(height: 12),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6399,
            child: ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: HomeScreenData.postModelList.length,
              itemBuilder: (context, index) {
                var post = HomeScreenData.postModelList[index];
                // final isliked = HomeScreenData.postModelList[index].isLiked;
                return PostItem(
                  post: post,
                  onLikePressed: (updatedPost, isLiked) {},
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
