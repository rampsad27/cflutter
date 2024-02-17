import 'package:flutter/material.dart';

class GridViewShow extends StatelessWidget {
  const GridViewShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 98,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.teal,
          child: Text(
            'Item $index',
            style: const TextStyle(fontSize: 16),
          ),
        );
      },
    );
  }
}
