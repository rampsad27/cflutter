import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/data/home_screen_data.dart';
import 'package:instagram_app/modules/ui/components/bottom_navigation_bar.dart';
import 'package:instagram_app/modules/ui/components/post_item.dart';
import 'package:instagram_app/modules/ui/components/story_component.dart';
import 'package:instagram_app/modules/ui/theme/bloc/theme_bloc.dart';
import 'package:instagram_app/modules/ui/theme/configs/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final int _selectedIndex = 0;s
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: const SizedBox(),
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontFamily: "Billabong",
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 188, 188, 188),
              borderRadius: BorderRadius.circular(60),
            ),
            height: 40,
            width: 96,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<ThemeBloc>().add(
                        ThemeChangeRequested(themeData: AppTheme.lightTheme));
                  },
                  icon: const Icon(
                    Icons.sunny,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<ThemeBloc>().add(
                        ThemeChangeRequested(themeData: AppTheme.darkTheme));
                  },
                  icon: const Icon(
                    Icons.nightlight_round_outlined,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.heart,
                  color: Colors.white,
                ),
              ),
              const Positioned(
                  right: 12,
                  top: 13,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.red,
                  ))
            ],
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.facebookMessenger),
                color: Colors.white,
              ),
              Positioned(
                right: 4,
                top: 2,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  // radius: 8,
                  // backgroundColor: Colors.red,
                  child: const Center(
                    child: Text(
                      "1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: StoryComponent(),
          ),
          SliverList.builder(
            itemCount: HomeScreenData.postModelList.length,
            itemBuilder: (context, index) {
              return PostItem(
                post: HomeScreenData.postModelList[index],
                onLikePressed: (updatedPost, isLiked) {},
              );
            },
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigationBaar(),
    );
  }
}
