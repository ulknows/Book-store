import 'package:flutter/material.dart';
import 'package:fooderlich/models/book_manager.dart';
import 'package:provider/provider.dart';

import '../models/app_state_manager.dart';
import '../models/models.dart';
import '../screens/book_detail_screen.dart';

class RecentBookCard extends StatelessWidget {
  final Book book;

  const RecentBookCard({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 10, bottom: 20),
          width: 150,
          height: 225,
          child: InkWell(
              onTap: () {
                //
                // final manager =
                //     Provider.of<BookManager>(context, listen: false);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => BookDetailScreen(book: book,
                //     ),
                //   ),
                // );
                Provider.of<AppStateManager>(context, listen: false)
                    .goToDetail(book, Key(toString()));
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(book.imageURL),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
              )),
        ),
        Column(
          children: [
            Text(
              book.name,
              style: TextStyle(fontSize: 17),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 5,
              ),
              child: Text(
                'Pages: ' + book.pages.toString(),
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
