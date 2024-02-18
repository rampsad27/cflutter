import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ig/ui/modules/editProfile/bloc/edit_profile_bloc.dart';

class UserName extends StatefulWidget {
  const UserName({super.key});

  @override
  State<UserName> createState() => _NameState();
}

class _NameState extends State<UserName> {
  final TextEditingController _controller = TextEditingController();
  bool _isNotEmpty = false;

  String _savedText = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final isNotEmpty = _controller.text.isNotEmpty;
      if (isNotEmpty != _isNotEmpty) {
        setState(() {
          _isNotEmpty = isNotEmpty;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        title: const Text("UserName"),
        actions: [
          InkWell(
            onTap: _isNotEmpty
                ? () {
                    setState(() {
                      _savedText = _controller.text;
                    });
                    Navigator.pop(context);
                  }
                : null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Done",
                style: TextStyle(
                  fontSize: 16,
                  color: _isNotEmpty ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 162, 162, 162),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 164, 164, 164),
                  ),
                ),
                labelText: "UserName",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Icon(Icons.close),
              ),
              onFieldSubmitted: (value) => context.read<EditProfileBloc>().add(
                  EditProfileDataRequested(
                      name: "", username: _controller.text, bio: "")),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
