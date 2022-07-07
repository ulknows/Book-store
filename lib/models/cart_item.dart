import 'package:flutter/painting.dart';

import 'book.dart';

class CartItem {
  // final int id;

  final Book book;
  late final int quantity;
  final String date;

  void addQuan(int amount){
    this.quantity += amount;
  }


  CartItem({
    // required this.id,
    required this.book,
    required this.quantity,
    required this.date,
  });

  CartItem copyWith({
    // int? id,
    Book? book,
    int? quantity,
    String? date,
  }) {
    return CartItem(
      // id: id ?? this.id,
      book: book ?? this.book,
      quantity: quantity ?? this.quantity,
      date: date ?? this.date
    );
  }

  Map toJson() => {
    // 'id': id,
    'book': book.toJson(),
    'quantity': quantity,
    'date': date
  };
}
