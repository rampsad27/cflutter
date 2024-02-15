import 'package:flutter/material.dart';
import 'package:ig/ui/modules/theme/configs/container_theme.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.remove),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ThemeColorContainer.getContainerBackgroundColor(
                        context),
                    borderRadius: BorderRadius.circular(10)),
                width: 175,
                height: 70,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bookmark_border_outlined),
                    SizedBox(height: 5),
                    Text(
                      'Save',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                    color: ThemeColorContainer.getContainerBackgroundColor(
                        context),
                    borderRadius: BorderRadius.circular(10)),
                width: 175,
                height: 70,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code_scanner_sharp),
                    SizedBox(height: 5),
                    Text(
                      'QR code',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                color: ThemeColorContainer.getContainerBackgroundColor(context),
                borderRadius: BorderRadius.circular(10)),
            height: 54,
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.send),
                  SizedBox(width: 10),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "We've moved things around.",
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        "See where to share and copy link",
                        style: TextStyle(color: Colors.blue, fontSize: 13),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                color: ThemeColorContainer.getContainerBackgroundColor(context),
                borderRadius: BorderRadius.circular(10)),
            height: 80,
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.star_border),
                      SizedBox(width: 10),
                      Text("Add to favorites"),
                    ],
                  ),
                  Divider(
                    color: Color.fromARGB(95, 152, 152, 152),
                  ),
                  Row(
                    children: [
                      Icon(Icons.person_remove_alt_1_outlined),
                      SizedBox(width: 10),
                      Text("Unfollow"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                color: ThemeColorContainer.getContainerBackgroundColor(context),
                borderRadius: BorderRadius.circular(10)),
            height: 160,
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_pin),
                      SizedBox(width: 10),
                      Text("About this account"),
                    ],
                  ),
                  Divider(
                    color: Color.fromARGB(95, 152, 152, 152),
                  ),
                  Row(
                    children: [
                      Icon(Icons.perm_device_information_sharp),
                      SizedBox(width: 10),
                      Text("Why you're seeing this post"),
                    ],
                  ),
                  Divider(
                    color: Color.fromARGB(95, 152, 152, 152),
                  ),
                  Row(
                    children: [
                      Icon(Icons.remove_red_eye_outlined),
                      SizedBox(width: 10),
                      Text("Hide"),
                    ],
                  ),
                  Divider(
                    color: Color.fromARGB(95, 152, 152, 152),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.report_gmailerrorred_rounded,
                        color: Colors.red,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Report",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
