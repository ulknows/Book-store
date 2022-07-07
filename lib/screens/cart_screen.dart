import 'package:flutter/material.dart';
import 'package:fooderlich/screens/payment.dart';

import '../models/models.dart';
import 'empty_cart_screen.dart';
import 'book_adding_cart.dart';
import 'login_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GroceryScreen();
  }
}

class _GroceryScreen extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          textAlign: TextAlign.center,
        ),
      ),
      body: buildGroceryScreen(),
      bottomNavigationBar: bottomContainer(),
    );
  }

  Widget bottomContainer() {
    if (User_Control.loggedIn == false) {
      return InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
          child: Container(
            color: Colors.red,
            height: 80,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    'You must login before checkout!',
                    style: TextStyle(fontSize: 25),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                        'Tap to Login.',
                        style: TextStyle(fontSize: 15)
                    ),
                  )
                ],
              ),
            )
          ));
    } else {
      return Container(
          color: Colors.greenAccent,
          height: 100,
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              if (BookManager.cart.length > 0) {
                var gm = BookManager();
                gm.clearItem();
                BookManager.cart.clear();
                print('removed | cart : ' + BookManager.cart.length.toString());

                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Payment()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('No item to checkout!'),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
            },
            child: Text(
              'CheckOut ' +
                  '(Qty: ' +
                  BookManager.getItem().toString() +
                  'x Total: ' +
                  BookManager.getPrice().toString() +
                  '฿)',
              style: TextStyle(fontSize: 25),
            ),
          ));
    }
  }

  Widget buildGroceryScreen() {
    if (BookManager.cart.isNotEmpty) {
      BookManager manager = BookManager();
      return BookAddingCart(manager: manager);
    } else {
      return const EmptyCartScreen();
    }
  }
}
