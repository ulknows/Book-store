import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_state_manager.dart';
import '../models/book.dart';
import '../models/book_manager.dart';
import '../screens/book_detail_screen.dart';

class AllBookTile extends StatelessWidget {
  final Book book;

  const AllBookTile({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightSize = 110;
    return InkWell(
        onTap: () {
          // final manager = Provider.of<BookManager>(context, listen: false);
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
          padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 20,
                ),
                width: 70,
                height: heightSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(book.imageURL),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              Expanded(
                  child: Container(
                height: heightSize,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.name + ' (' + book.yearWrite + ')',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              'Writer: ',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              book.author,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Category: ',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              book.category,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'Date added: ',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                              Text(
                                book.dateAdd,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Price: ' + book.price.toString() + '฿',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [

                    //
                    //   ],
                    // )
                  ],
                ),
              )),
            ],
          ),
        )
    );
  }
}
