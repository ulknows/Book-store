import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class EmptyCartScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: Pages.cart, key: ValueKey(Pages.cart), child: EmptyCartScreen());
  }
  const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1
    return Padding(
      padding: const EdgeInsets.all(30.0),
      // 2
      child: Center(
        // 3
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Icon(Icons.book, size: 100,),
              )
            ),
            Text(
              'No book in cart',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Finding book?\n'
              'Tap book in Explore book screen to add to cart',
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: MaterialButton(
                textColor: Colors.white,
                child: const Text('Browse Books'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                  Provider.of<TabManager>(context, listen: false).goToTab(0);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
