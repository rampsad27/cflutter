import 'package:flutter/material.dart';
import 'package:instagram_app/modules/ui/screens/login_screen.dart';

class InstagramWelcomePage extends StatelessWidget {
  const InstagramWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text(
              "Instagram",
              style: TextStyle(
                  fontFamily: "BillaBong", fontSize: 80, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
