import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ig/ui/modules/screen/story.dart';
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
                  // child: CircleAvatar(
                  //     radius: 39,
                  //     Image.network(
                  //         "https://images.unsplash.com/photo-1706067003003-f5d8d518c00b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHx8fA%3D%3D"),
                  //         )),
                ),
              );
            },
          ),
        ),
        // const HorizontalLineWithText(),
        Expanded(
          child: ListView.builder(
            itemCount: widget.postModelList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(
                    () {
                      selectedIndex = index;
                    },
                  );
                },
                child: Container(
                  height: 330,
                  margin: const EdgeInsets.only(bottom: 30),
                  // color: const Color.fromARGB(255, 131, 170, 224),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.postModelList[index].postedby,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.network(
                          widget.postModelList[index].imageUrl,
                          width: double.infinity,
                          height: 198,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.heart),
                            SizedBox(width: 8),
                            Icon(Icons.comment_rounded), SizedBox(width: 8),
                            Icon(Icons.send),
                            Spacer(), // Spacer widget takes up any remaining space
                            Icon(Icons.bookmark_border_outlined),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          " ${widget.postModelList[index].likes} likes",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          " View all ${widget.postModelList[index].comments} comments",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 156, 156, 156),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class PostModel {
  final String postedby;
  final String likes;
  final String comments;
  final String imageUrl;

  PostModel({
    required this.postedby,
    required this.likes,
    required this.comments,
    required this.imageUrl,
  });
}
