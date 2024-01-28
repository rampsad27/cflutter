import 'package:flutter/material.dart';
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
      // if (scrollController.offset > 100) {
      //   print("offset");
      // }

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
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF1IwK6-SxM83UpFVY6WtUZxXx-phss_gAUfdKbkTfau6VWVkt"),
                ),
                SizedBox(width: 8), // Adding some space between avatar and text
                Text("hyatteri"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 203, 203, 203),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 30,
                  width: 167,
                  child: const Center(
                    child: Text(
                      "Edit profile",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 203, 203, 203),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 30,
                  width: 167,
                  child: const Center(
                    child: Text(
                      "Share profile",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 203, 203, 203),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 30,
                  width: 32,
                  child: const Icon(
                    Icons.person_add_alt_sharp,
                    size: 20,
                  ),
                ),
              ],
            ),
            const Row(children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF1IwK6-SxM83UpFVY6WtUZxXx-phss_gAUfdKbkTfau6VWVkt"),
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF1IwK6-SxM83UpFVY6WtUZxXx-phss_gAUfdKbkTfau6VWVkt"),
              ),
            ])
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
