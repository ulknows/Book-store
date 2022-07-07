import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_data_service.dart';

class MostRecentListView extends StatelessWidget {
  final List<Book> booklist;

  const MostRecentListView({
    Key? key,
    required this.booklist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Book> bookRecent = [];
    if (booklist.length > 5) {
      for (int i = 0; i < 5; i++) {
        bookRecent.add(booklist[booklist.length - 1 - i]);
      }
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: 16,bottom: 16),
              child: Text(
                'Most Recent Books!',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Container(
              height: 320,
              color: Colors.orange[60],
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: bookRecent.length,
                  itemBuilder: (context, index) {
                    final book = bookRecent[index];
                    return buildCard(book);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16);
                  },
                ),
              )),
        ],
      )
    );

  }

  Widget buildCard(Book book) {
    return RecentBookCard(book: book);
  }
}
