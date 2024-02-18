import 'package:extraaa/ui/modules/book_list_data.dart';
import 'package:flutter/material.dart';

class GridViewShow extends StatelessWidget {
  const GridViewShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: BookListData.bookList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        childAspectRatio: 0.8 / 1.5,
      ),
      itemBuilder: (BuildContext context, int index) {
        final book = BookListData.bookList[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(book.coverImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              book.name,
              style: const TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
              overflow: TextOverflow.ellipsis, // Prevent overflow
            ),
            Text(
              book.author,
              style: const TextStyle(
                  fontSize: 12, color: Color.fromARGB(179, 100, 100, 100)),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
