import 'package:flutter/material.dart';
import 'package:fooderlich/screens/book_detail_screen.dart';

import '../components/components.dart';
import '../models/book.dart';
import 'components.dart';

class BookListView extends StatelessWidget {
  final List<Book> allBook;

  const BookListView({
    Key? key,
    required this.allBook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        // left: 16,
        // right: 16,
        top: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.orangeAccent,
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 16,
              bottom: 16
            ),
            child: Text(
              'List of books',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          ListView.separated(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: allBook.length,
              itemBuilder: (context, index) {
                final books = allBook[index];
                return AllBookTile(book: books);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              }),
        ],
      ),
    );
  }
}
