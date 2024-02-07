import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ig/ui/modules/imagePicker/bloc/imagepicker_bloc.dart';
import 'package:ig/ui/modules/screen/editProfileScreens/bioScreen.dart';
import 'package:ig/ui/modules/screen/editProfileScreens/nameScreen.dart';
import 'package:ig/ui/modules/screen/editProfileScreens/usernameScreen.dart';
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
        child: Column(
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
                          radius: 44,
                          backgroundImage: state is ImageAndFilePickerFilePicked
                              // ignore: unnecessary_cast
                              ? FileImage(state.pickedFile!)
                                  as ImageProvider<Object>
                              // ignore: unnecessary_cast
                              : const NetworkImage(
                                      "https://imgupscaler.com/images/samples/animal-after.webp")
                                  as ImageProvider<Object>,
                          //  as ImageProvider<Object>,
                        ),

                        const SizedBox(
                            width: 10), // Add some spacing between avatars
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
                        context
                            .read<ImageAndFilePickerBloc>()
                            .add(ImageAndFilePickUpRequested());
                      },
                      child: const Text("Edit profile or avatar",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                          )),
                    ),
                    if (state is ImageAndFilePickerLoadInProgress) ...[
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ] else if (state is ImageAndFilePickerFailure) ...[
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text(state.errorMessage),
                      ),
                    ],
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            const MyEditProfileWidget(
              one: "Name",
              two: "Add Name",
              destinationPage: Name(),
            ),
            const MyEditProfileWidget(
              one: "Username",
              two: "add",
              destinationPage: UserName(),
            ),
            const MyEditProfileWidget(
              one: "Pronouns",
              two: "Add pronouns",
              destinationPage: Bio(),
            ),
            const MyEditProfileWidget(
              one: "Bio",
              two: "Add bio",
              destinationPage: Bio(),
            ),
            const MyEditProfileWidget(
              one: "Links",
              two: "Add Links",
              destinationPage: Bio(),
            ),
          ],
        ),
      ),
    );
  }
}
