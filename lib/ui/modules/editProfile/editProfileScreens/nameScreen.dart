import 'package:flutter/material.dart';

class Name extends StatefulWidget {
  const Name({super.key});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
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
        title: const Text("Name"),
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
                labelText: "Name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Icon(Icons.close),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
