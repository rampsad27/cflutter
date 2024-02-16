import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/modules/ui/screens/EditProfileScreen/bloc/details_bloc/bloc/details_bloc.dart';

class EditProfileScreenBio extends StatefulWidget {
  const EditProfileScreenBio({super.key});

  @override
  State<EditProfileScreenBio> createState() => _EditProfileScreenBioState();
}

class _EditProfileScreenBioState extends State<EditProfileScreenBio> {
  final TextEditingController _bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                final bio = _bioController.text;
                context
                    .read<DetailsBloc>()
                    .add(DetailsSaveRequested("", "", bio));
                Navigator.of(context).pop();
              },
              icon: const FaIcon(
                FontAwesomeIcons.check,
                color: Colors.blue,
              ))
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const FaIcon(
            FontAwesomeIcons.xmark,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Bio",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocBuilder<DetailsBloc, DetailsState>(
              builder: (context, state) {
                return TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: _bioController
                    ..text =
                        state is DetailsLoaded ? state.userDetails.bio : "",
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255))),
                    labelText: "Bio",
                    labelStyle: TextStyle(color: Colors.white),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
