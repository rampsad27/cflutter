import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/modules/ui/screens/EditProfileScreen/bloc/details_bloc/bloc/details_bloc.dart';

class EditProfileScreenName extends StatefulWidget {
  const EditProfileScreenName({super.key});

  @override
  State<EditProfileScreenName> createState() => _EditProfileScreenNameState();
}

class _EditProfileScreenNameState extends State<EditProfileScreenName> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                final name = _nameController.text;
                context
                    .read<DetailsBloc>()
                    .add(DetailsSaveRequested(name, "", ""));

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
          "Name",
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
                  controller: _nameController
                    ..text =
                        state is DetailsLoaded ? state.userDetails.name : "",
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255))),
                    labelText: "Name",
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
