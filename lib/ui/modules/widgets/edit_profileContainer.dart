import 'package:flutter/material.dart';

class MyEditProfileWidget extends StatelessWidget {
  final String one;
  final String two;
  final Widget destinationPage;

  const MyEditProfileWidget(
      {Key? key,
      required this.destinationPage,
      required this.one,
      required this.two})
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
                one,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.normal),
              ),
              const SizedBox(width: 20),
              Text(
                two,
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
