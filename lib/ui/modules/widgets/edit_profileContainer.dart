import 'package:flutter/material.dart';
import 'package:ig/ui/modules/screen/editProfileScreens/nameScreen.dart';

class MyEditProfileWidget extends StatelessWidget {
  final String one;
  final String two;

  const MyEditProfileWidget({Key? key, required this.one, required this.two})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Name()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(one),
          const SizedBox(width: 10),
          Text(two),
        ],
      ),
    );
  }
}
