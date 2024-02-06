import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ig/ui/data/profilenum_data.dart';
import 'package:ig/ui/modules/components/buildcircularavatar.dart';
import 'package:ig/ui/modules/components/buildprofilebutton.dart';
import 'package:ig/ui/modules/components/buildprofileiconbutton.dart';
import 'package:ig/ui/modules/loginauth/bloc/login_bloc.dart';
import 'package:ig/ui/modules/loginauth/repository/authentication_repository.dart';
import 'package:ig/ui/modules/widgets/bottom_navigation.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  ScrollController scrollController = ScrollController();
  bool showTitle = false;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.minScrollExtent < 1) {
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
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                pinned: false,
                floating: true,
                snap: true,
                title: Text(
                  context.read<AuthenticationRepository>().getUserInfo().email,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_box_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.list_outlined),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Column(
                    children: [
                      const Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              "https://img.etimg.com/thumb/width-640,height-480,imgsize-59990,resizemode-75,msid-95129274/news/international/us/national-black-cat-day-see-why-us-celebrates-this-occasion.jpg",
                            ),
                          ),
                          SizedBox(width: 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ProfileNum(value: "23", title: "Posts"),
                              SizedBox(width: 20),
                              ProfileNum(value: "89", title: "Followers"),
                              SizedBox(width: 20),
                              ProfileNum(value: "76", title: "Following"),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildProfileButton("Edit profile"),
                          const SizedBox(width: 2),
                          InkWell(
                            onTap: () {
                              context
                                  .read<LoginBloc>()
                                  .add(LogInLogOutRequested());
                            },
                            child: buildProfileButton("Share profile"),
                          ),
                          const SizedBox(width: 2),
                          buildProfileIconButton(Icons.person_add_alt_sharp),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildCircleAvatar(
                            "https://img.etimg.com/thumb/width-640,height-480,imgsize-59990,resizemode-75,msid-95129274/news/international/us/national-black-cat-day-see-why-us-celebrates-this-occasion.jpg",
                            30,
                          ),
                          const SizedBox(width: 10),
                          buildCircleAvatar(
                            "https://img.etimg.com/thumb/width-640,height-480,imgsize-59990,resizemode-75,msid-95129274/news/international/us/national-black-cat-day-see-why-us-celebrates-this-occasion.jpg",
                            30,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: TabBar(
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Colors.black,
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 75),
                  ),
                  tabs: [
                    Tab(
                      icon: Icon(Icons.grid_on_sharp),
                    ),
                    Tab(
                      icon: Icon(Icons.video_library_outlined),
                    ),
                    Tab(
                      icon: Icon(Icons.person_pin_outlined),
                    ),
                  ],
                ),
              )
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
                  ),
                  itemCount: 19,
                  itemBuilder: (context, index) {
                    return Container(
                      // height: 120,
                      // margin: const EdgeInsets.all(2),
                      color: const Color.fromARGB(255, 156, 163, 226),
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
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Container(
                      // height: 120,
                      margin: const EdgeInsets.all(2),
                      color: const Color.fromARGB(255, 147, 201, 168),
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
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Container(
                      // height: 120,
                      margin: const EdgeInsets.all(2),
                      color: const Color.fromARGB(255, 226, 156, 226),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
