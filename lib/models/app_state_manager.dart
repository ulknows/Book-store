import 'dart:async';
import 'package:flutter/material.dart';

import 'book.dart';

// 1

class AppStateManager extends ChangeNotifier {
  bool detail = false;
  bool cart = false;
  late Book book;
  late Key key;
  get getKey => this.key;

  get getBook => this.book;

  get getDetail => this.detail;

  get getCart => this.cart;

  void goToCart() {
    cart = true;
    notifyListeners();
  }

  void goToDetail(
    Book item,
    Key key,
  ) {
    book = item;
    this.key = key;
    detail = true;
    notifyListeners();
  }

  void outFormCart() {
    cart = false;
    notifyListeners();
  }

  void outFormDetail() {
    detail = false;
    notifyListeners();
  }
}
