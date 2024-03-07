import 'package:extraaa/ui/modules/book_list_data.dart';
import 'package:flutter/material.dart';

class ListViewShow extends StatefulWidget {
  final Function(bool isSelected)? onSelectionChanged;
  const ListViewShow({
    super.key,
    this.onSelectionChanged,
  });

  @override
  State<ListViewShow> createState() => _ListViewShowState();
}

class _ListViewShowState extends State<ListViewShow> {
  int? _selectedBookIndex;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: BookListData.bookList.length,
      itemBuilder: (context, int index) {
        final book = BookListData.bookList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(book.coverImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.name,
                      style: const TextStyle(
                          fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book.author,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(179, 100, 100, 100)),
                      overflow: TextOverflow.ellipsis,
                    ),
                    // const Spacer(),
                    Row(
                      children: [
                        Text(
                          book.publisher,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(179, 100, 100, 100)),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "${book.yearOfPub} pages",
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(179, 100, 100, 100)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Radio<int>(
                value: index,
                groupValue: _selectedBookIndex,
                onChanged: (value) {
                  setState(() {
                    _selectedBookIndex = value;
                  });
                  widget.onSelectionChanged?.call(value != null);
                },
                activeColor: Colors.blue,
              ),
            ],
          ),
        );
      },
    );
  }
}
