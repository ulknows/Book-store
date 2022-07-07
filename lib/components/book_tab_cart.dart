import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/book.dart';
import '../models/cart_item.dart';

class BookTabCart extends StatelessWidget {
  // 1
  final CartItem item;

  // 4
  BookTabCart({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 1
          Row(
            children: [
              // 2
              Container(width: 5.0, color: Color.fromARGB(1, 255, 255, 255)),
              // 3
              const SizedBox(width: 16.0),
              // 4
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.book.name + ' (' + item.book.yearWrite + ')',
                    style: GoogleFonts.lato(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Writer: ' + item.book.author,
                    style: GoogleFonts.lato(
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    'Catrgory: ' + item.book.category,
                    style: GoogleFonts.lato(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 7
              Text(
                'x' + item.quantity.toString(),
                style: GoogleFonts.lato(
                  fontSize: 21,
                ),
              ),
              Text(
                'Total: ' + (item.quantity * item.book.price).toString() + '฿',
                style:
                    GoogleFonts.lato(fontSize: 19),
              )
            ],
          )
        ],
      ),
    );
  }
}
