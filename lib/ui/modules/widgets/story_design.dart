import 'package:flutter/material.dart';

class Storydesign extends StatelessWidget {
  const Storydesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: const CircleAvatar(
        radius: 34,
        backgroundImage: AssetImage("assets/images/sb.jpg"),
      ),
    );
  }
}
