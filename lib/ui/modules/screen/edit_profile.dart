import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ig/ui/modules/editProfile/bloc/edit_profile_bloc.dart';
import 'package:ig/ui/modules/editProfile/editProfileScreens/picturebottomSheet.dart';
import 'package:ig/ui/modules/imagePicker/bloc/imagepicker_bloc.dart';
import 'package:ig/ui/modules/editProfile/editProfileScreens/bioScreen.dart';
import 'package:ig/ui/modules/editProfile/editProfileScreens/nameScreen.dart';
import 'package:ig/ui/modules/editProfile/editProfileScreens/usernameScreen.dart';
import 'package:ig/ui/modules/widgets/edit_profileContainer.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<EditProfileBloc, EditProfileState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ImageAndFilePickerBloc, ImageAndFilePickerState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundImage: () {
                                if (state is ImageAndFilePickerFilePicked) {
                                  // ignore: unnecessary_cast
                                  return FileImage(state.pickedFile!)
                                      as ImageProvider<Object>;
                                } else if (state is TakePicturePicked) {
                                  // ignore: unnecessary_cast
                                  return FileImage(state.pickedImage!)
                                      as ImageProvider<Object>;
                                } else {
                                  // ignore: unnecessary_cast
                                  return const NetworkImage(
                                          "https://imgupscaler.com/images/samples/animal-after.webp")
                                      as ImageProvider<Object>;
                                }
                              }(),
                            ),
                            const SizedBox(width: 10),
                            const CircleAvatar(
                              radius: 44,
                              backgroundImage: NetworkImage(
                                  "https://banner2.cleanpng.com/20201031/xyt/transparent-sports-icon-man-icon-man-practicing-exercise-icon-5f9e1c08c5de08.3937662516041973848105.jpg"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) =>
                                  const PictureBottomSheet(),
                            );
                          },
                          child: const Text("Edit profile or avatar",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                              )),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),
                MyEditProfileWidget(
                  title: "Name",
                  value: state is EditProfileDataSuccess ? state.name : "",
                  destinationPage: const Name(),
                ),
                MyEditProfileWidget(
                  title: "Username",
                  value: state is EditProfileDataSuccess ? state.username : "",
                  destinationPage: const UserName(),
                ),
                const MyEditProfileWidget(
                  title: "Pronouns",
                  value: "Add pronouns",
                  destinationPage: Bio(),
                ),
                const MyEditProfileWidget(
                  title: "Bio",
                  value: "Add bio",
                  destinationPage: Bio(),
                ),
                const MyEditProfileWidget(
                  title: "Links",
                  value: "Add Links",
                  destinationPage: Bio(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
