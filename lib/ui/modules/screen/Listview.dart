import 'package:flutter/material.dart';

class ListViewShow extends StatelessWidget {
  const ListViewShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 23,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 100,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Book $index',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }
}
