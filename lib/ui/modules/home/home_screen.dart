import 'package:copymar/ui/modules/profiles/screen/dashboard_screen.dart';
import 'package:copymar/ui/modules/profiles/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        title: const Text(
          "Programs",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: const Color.fromARGB(255, 240, 239, 239),
              ),
              padding: const EdgeInsets.all(12),
              width: 500.0,
              height: 90.0,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bass Memorial Academy",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CartItem(title: "Program Cycle", value: "Winter"),
                      CartItem(title: "Program Cycle", value: "Winter"),
                      CartItem(title: "Program Cycle", value: "Winter"),
                    ],
                  )
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       child: Text(
                  //         "Program Cycle",
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           color: Color.fromARGB(255, 89, 88, 88),
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Text(
                  //         "Start Date",
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           color: Color.fromARGB(255, 89, 88, 88),
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Text(
                  //         "End Date",
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           color: Color.fromARGB(255, 89, 88, 88),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Text(
                  //         "Winter",
                  //         style: TextStyle(
                  //           fontSize: 12,
                  //           color: Color.fromARGB(255, 120, 118, 118),
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Text(
                  //         "12/2/2022",
                  //         style: TextStyle(
                  //           fontSize: 12,
                  //           color: Color.fromARGB(255, 120, 118, 118),
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Text(
                  //         "12/2/2322",
                  //         style: TextStyle(
                  //           fontSize: 12,
                  //           color: Color.fromARGB(255, 120, 118, 118),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                ),
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 147, 173),
                  borderRadius: BorderRadius.circular(3),
                ),
                height: 50,
                width: 5000,
                child: const Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
