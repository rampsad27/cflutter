import 'package:flutter/material.dart';
import 'package:ig/ui/modules/screen/editProfileScreens/nameScreen.dart';
import 'package:ig/ui/modules/widgets/edit_profileContainer.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_sharp),
        ),
        title: const Text("Edit profile"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 44,
                      backgroundImage: NetworkImage(
                          "https://imgupscaler.com/images/samples/animal-after.webp"),
                    ),
                    SizedBox(width: 10), // Add some spacing between avatars
                    CircleAvatar(
                      radius: 44,
                      backgroundImage: NetworkImage(
                          "https://banner2.cleanpng.com/20201031/xyt/transparent-sports-icon-man-icon-man-practicing-exercise-icon-5f9e1c08c5de08.3937662516041973848105.jpg"),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Edit profile or avatar",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            MyEditProfileWidget(one: "Name", two: "Add Name"),
            MyEditProfileWidget(one: "Username", two: "add"),
            MyEditProfileWidget(one: "Bio", two: "Add bio"),
          ],
        ),
      ),
    );
  }
}
