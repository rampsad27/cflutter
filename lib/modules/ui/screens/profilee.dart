import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/modules/ui/components/bottom_navigation_bar.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  ScrollController scrollController = ScrollController();
  bool showTitle = false;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.minScrollExtent < 130) {
        setState(() {
          showTitle = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, value) {
            return [
              const SliverAppBar(
                backgroundColor: Colors.black,
                pinned: false,
                floating: true,
                title: Text(
                  'ramprasad',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        FaIcon(
                          FontAwesomeIcons.bars,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF1IwK6-SxM83UpFVY6WtUZxXx-phss_gAUfdKbkTfau6VWVkt",
                              ),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '26',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'posts',
                                      style: TextStyle(
                                          fontSize: 15,
                                          letterSpacing: 0.4,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '1.5m',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'followers',
                                      style: TextStyle(
                                        fontSize: 15,
                                        letterSpacing: 0.4,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '1.5m',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'following',
                                      style: TextStyle(
                                        fontSize: 15,
                                        letterSpacing: 0.4,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 16,
                                )
                              ],
                            ),
                          ],
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'sainamaskey',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildProfileButton("Edit profile"),
                            buildProfileButton("Share profile"),
                            buildProfileIconButton(Icons.person_add_alt_sharp),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            buildCircleAvatar(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF1IwK6-SxM83UpFVY6WtUZxXx-phss_gAUfdKbkTfau6VWVkt",
                              30,
                            ),
                            buildCircleAvatar(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF1IwK6-SxM83UpFVY6WtUZxXx-phss_gAUfdKbkTfau6VWVkt",
                              30,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: TabBar(
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  // indicatorWeight: 1,
                  indicatorColor: Colors.white,
                  indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.white,
                      ),
                      insets: EdgeInsets.symmetric(horizontal: 75)),
                  // indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    const Tab(
                      icon: Icon(Icons.grid_on_sharp),
                    ),
                    Tab(
                      icon: SvgPicture.asset(
                        'assets/icons/vectors/video-play-outline.svg',
                        height: 28,
                        colorFilter: const ColorFilter.mode(
                            Colors.grey, BlendMode.srcIn),
                      ),
                    ),
                    const Tab(
                      icon: FaIcon(FontAwesomeIcons.user),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    // crossAxisCount: 3,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      // height: 120,
                      // margin: const EdgeInsets.all(20),
                      color: Colors.amber,
                    );
                  },
                ),
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    // crossAxisCount: 3,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      // height: 120,
                      // margin: const EdgeInsets.all(20),
                      color: Colors.amber,
                    );
                  },
                ),
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    // crossAxisCount: 3,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Container(
                      // height: 120,
                      // margin: const EdgeInsets.all(20),
                      color: Colors.amber,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBaar(),
    );
  }

  Widget buildProfileButton(String text) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff25282D),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 30,
      width: 167,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildProfileIconButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff25282D),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 30,
      width: 32,
      child: Icon(
        icon,
        size: 20,
        color: Colors.white,
      ),
    );
  }

  Widget buildCircleAvatar(String imageUrl, double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}
