import 'package:flutter/material.dart';
import 'package:fooderlich/screens/cart_screen.dart';

import '../components/book_tab_cart.dart';
import '../models/models.dart';

class BookAddingCart extends StatelessWidget {
  final BookManager manager;

  const BookAddingCart({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1
    // final groceryItems = manager.groceryItems;
    // 2
    return Padding(
      padding: const EdgeInsets.all(16.0),
      // 3
      child: ListView.separated(
        // 4
        itemCount: BookManager.cart.length,
        itemBuilder: (context, index) {
          final item = BookManager.cart[index];
          // 1
          return
            Dismissible(
            // 6
            key: Key(''),
            // 7
            direction: DismissDirection.endToStart,
            // 8
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 50.0,
              ),
            ),
            // 9
            onDismissed: (direction) {
              // 10

              BookManager.cart.removeAt(index);
              // groceryItems.remove(index);
              // 11
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Book: ${item.book.name} deleted'),
                ),
              );
              
              Navigator.pop(context);
              Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => CartScreen()
                ),);
            },
            child:
            BookTabCart(
                item: item,
              ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        },
      ),
    );
  }


}
