import 'package:flutter/material.dart';

class MyEditProfileWidget extends StatelessWidget {
  final String title;
  final String value;
  final Widget destinationPage;

  const MyEditProfileWidget(
      {Key? key,
      required this.destinationPage,
      required this.title,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => destinationPage));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.normal),
              ),
              const SizedBox(width: 20),
              Text(
                value,
                style: const TextStyle(
                    color: Color.fromARGB(96, 102, 102, 102), fontSize: 18),
              ),
            ],
          ),
          const Divider(
            thickness: 0,
            indent: 70,
          ),
        ],
      ),
    );
  }
}
