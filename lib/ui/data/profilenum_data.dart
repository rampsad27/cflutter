import 'package:flutter/material.dart';

class ProfileNum extends StatelessWidget {
  const ProfileNum({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
        ),
        Text(title),
      ],
    );
  }
}
