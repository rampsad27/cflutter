import 'package:flutter/material.dart';

class StoryComponent extends StatefulWidget {
  const StoryComponent({Key? key}) : super(key: key);

  @override
  State<StoryComponent> createState() => _StoryComponentState();
}

class _StoryComponentState extends State<StoryComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 101,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 100,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 12),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage('assets/images/pink-floyd.png'),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'ramprasad',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
