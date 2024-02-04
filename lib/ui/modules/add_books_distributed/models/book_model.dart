// ignore_for_file: public_member_api_docs, sort_constructors_first
class BookModel {
  final String title;
  final String code;
  final int quantity;
  BookModel({
    required this.title,
    required this.code,
    required this.quantity,
  });

  BookModel copyWith({
    String? title,
    String? code,
    int? quantity,
  }) {
    return BookModel(
      title: title ?? this.title,
      code: code ?? this.code,
      quantity: quantity ?? this.quantity,
    );
  }
}
