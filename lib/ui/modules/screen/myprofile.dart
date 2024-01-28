import 'package:flutter/material.dart';
import 'package:ig/ui/modules/components/buildcircularavatar.dart';
import 'package:ig/ui/modules/components/buildprofilebutton.dart';
import 'package:ig/ui/modules/components/buildprofileiconbutton.dart';
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
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                title: const Text(
                  'madhu.ram',
                  style: TextStyle(
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
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF1IwK6-SxM83UpFVY6WtUZxXx-phss_gAUfdKbkTfau6VWVkt",
                            ),
                          ),
                          SizedBox(width: 8),
                          Text("hyatteri"),
                        ],
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "hi",
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildProfileButton("Edit profile"),
                          const SizedBox(width: 2),
                          buildProfileButton("Share profile"),
                          const SizedBox(width: 2),
                          buildProfileIconButton(Icons.person_add_alt_sharp),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildCircleAvatar(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF1IwK6-SxM83UpFVY6WtUZxXx-phss_gAUfdKbkTfau6VWVkt",
                            30,
                          ),
                          const SizedBox(width: 10),
                          buildCircleAvatar(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF1IwK6-SxM83UpFVY6WtUZxXx-phss_gAUfdKbkTfau6VWVkt",
                            30,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const TabBar(
                        tabs: [
                          Tab(
                            icon: Icon(Icons.view_list),
                          ),
                          Tab(
                            icon: Icon(Icons.video_library_outlined),
                          ),
                          Tab(
                            icon: Icon(Icons.person_pin_outlined),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 19,
                itemBuilder: (context, index) {
                  return Container(
                    // height: 120,
                    margin: const EdgeInsets.all(2),
                    color: const Color.fromARGB(255, 156, 163, 226),
                  );
                },
              ),
              GridView.builder(
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
              GridView.builder(
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
