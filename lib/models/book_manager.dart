import 'package:flutter/material.dart';

import 'cart_item.dart';

class BookManager extends ChangeNotifier {
  static List<CartItem> cart = [];

  static int getItem() {
    int count = 0;
    cart.forEach((element) {count+=element.quantity;});
    return count;
  }

  static double getPrice() {
    double total = 0;
    cart.forEach((element) {total += (element.quantity * element.book.price);});
    return total;
  }

  void deleteItem(int index) {
    cart.removeAt(index);

    // _groceryItems.removeAt(index);
    // refresh();
    // _groceryItems.removeAt(index);
    notifyListeners();
  }

  void clearItem(){
    BookManager.cart.clear();
    // _groceryItems.clear();
    notifyListeners();
  }


  void addItem(CartItem item) {
    cart.add(item);
    print(cart.length);
    // _groceryItems.add(item);
    // _groceryItems.add(item);
    notifyListeners();
  }

  void updateItem(CartItem item, int index) {
    cart[index] = item;
    // _groceryItems[index] = item;
    notifyListeners();
  }

  // void refresh() {
  //   for(int i = 0 ;i < cart.length; i++ ){
  //     cart[i].setID(i.toString());
  //   }
  //   // for(int i = 0;i < _groceryItems.length; i++){
  //   //   _groceryItems[i].setID(i.toString());
  //   // }
  //   notifyListeners();
  // }


}
