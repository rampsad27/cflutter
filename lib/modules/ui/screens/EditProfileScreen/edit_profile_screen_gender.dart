import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfileScreenGander extends StatefulWidget {
  const EditProfileScreenGander({super.key});

  @override
  State<EditProfileScreenGander> createState() =>
      _EditProfileScreenGanderState();
}

class _EditProfileScreenGanderState extends State<EditProfileScreenGander> {
  String? _gender = 'Male'; // default to 'Male'
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
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
          "Gender",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          RadioListTile<String>(
            controlAffinity: ListTileControlAffinity.trailing,
            title: const Text(
              'Female',
              style: TextStyle(color: Colors.white),
            ),
            value: 'Female',
            groupValue: _gender,
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            },
          ),
          RadioListTile<String>(
            controlAffinity: ListTileControlAffinity.trailing,
            title: const Text(
              'Male',
              style: TextStyle(color: Colors.white),
            ),
            value: 'Male',
            groupValue: _gender,
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            },
          ),
          RadioListTile<String>(
            controlAffinity: ListTileControlAffinity.trailing,
            title: const Text(
              'Custom',
              style: TextStyle(color: Colors.white),
            ),
            value: 'Custom',
            groupValue: _gender,
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            },
          ),
          RadioListTile<String>(
            controlAffinity: ListTileControlAffinity.trailing,
            title: const Text(
              'Prefer not to say',
              style: TextStyle(color: Colors.white),
            ),
            value: 'Prefer not to say',
            groupValue: _gender,
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
