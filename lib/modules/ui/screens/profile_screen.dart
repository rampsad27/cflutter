import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/data/profile_screen_data.dart';
import 'package:instagram_app/extension/int_extension.dart';
import 'package:instagram_app/modules/auth/SignIn/bloc/login_bloc.dart';
import 'package:instagram_app/modules/auth/SignIn/repository/login_auth_repo.dart';
import 'package:instagram_app/modules/ui/components/bottom_navigation_bar.dart';
import 'package:instagram_app/modules/ui/screens/EditProfileScreen/bloc/details_bloc/repository/details_repository.dart';
import 'package:instagram_app/modules/ui/screens/EditProfileScreen/bloc/pickerbloc/picker_bloc.dart';
import 'package:instagram_app/modules/ui/screens/edit_ptofile_screen.dart';
import 'package:instagram_app/data/ImageURLS/image_url.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  final profile = ProfileScreenData.profileModeList.first;

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
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.black,
                pinned: false,
                floating: true,
                title: Text(
                  context
                      .read<LoginAuthenticationRepository>()
                      .getLoginInfo()
                      .username,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                actions: const [
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
              BlocBuilder<PickerBloc, PickerState>(
                builder: (context, state) {
                  return SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: state is PickerInitialSuccess
                                      // ignore: unnecessary_cast
                                      ? FileImage(state.pickedFile!)
                                          as ImageProvider<Object>
                                      // ignore: unnecessary_cast
                                      : const NetworkImage(
                                              'https://yt3.googleusercontent.com/nSJ5V8HrAoJnDbb-_v3JJgjj69cUSU46O39hJxS5xs577MNWnkzJK4PxGhcQnT4FKCfvnIl13-U=s900-c-k-c0x00ffffff-no-rj')
                                          as ImageProvider<Object>,
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          profile.postCount.formatCount(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        const Text(
                                          'posts',
                                          style: TextStyle(
                                              fontSize: 15,
                                              letterSpacing: 0.4,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          profile.followersCount.formatCount(),
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Text(
                                          'followers',
                                          style: TextStyle(
                                            fontSize: 15,
                                            letterSpacing: 0.4,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          profile.followingCount.formatCount(),
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Text(
                                          'following',
                                          style: TextStyle(
                                            fontSize: 15,
                                            letterSpacing: 0.4,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                context
                                    .read<DetailsAuthRepository>()
                                    .getDetailsInfo()
                                    .name,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EditProfileScreen()));
                                    },
                                    child: buildProfileButton("Edit profile")),
                                InkWell(
                                    onTap: () {
                                      context
                                          .read<LoginBloc>()
                                          .add(LoginLogoutRequested());
                                    },
                                    child: buildProfileButton("Share profile")),
                                buildProfileIconButton(
                                    Icons.person_add_alt_sharp),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                buildCircleAvatar(
                                  "https://i.scdn.co/image/207803ce008388d3427a685254f9de6a8f61dc2e",
                                  30,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildCircleAvatar(
                                  "https://m.media-amazon.com/images/M/MV5BNzEwODM5NTQ4M15BMl5BanBnXkFtZTcwNDQ0NTU1OA@@._V1_FMjpg_UX1000_.jpg",
                                  30,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
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
                  itemCount: ImageUrls().urls.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      ImageUrls().urls[index],
                      fit: BoxFit.cover,
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
                    return Image.network(
                      ImageUrls().urls[index],
                      fit: BoxFit.cover,
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
                    return Image.network(
                      ImageUrls().urls[index],
                      fit: BoxFit.cover,
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
