import 'package:flutter/material.dart';
import 'package:fooderlich/screens/screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../components/book_tab_cart.dart';
import '../models/models.dart';

class BookDetailScreen extends StatefulWidget {
  static MaterialPage page(Book book, Key key) {
    return MaterialPage(
        name: Pages.book_detail,
        key: ValueKey(Pages.book_detail),
        child: BookDetailScreen(
          book: book,
          key: key,
        ));
  }

  final Book book;
  final CartItem? originalItem;
  final bool isUpdating;

  const BookDetailScreen({
    Key? key,
    required this.book,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState(book);
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  static BookManager gm = BookManager();
  final _nameController = TextEditingController();
  DateTime _dueDate = DateTime.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;
  late final Book book;

  _BookDetailScreenState(this.book);

  @override
  void initState() {
    super.initState();
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      book = originalItem.book;
      _currentSliderValue = originalItem.quantity;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (_currentSliderValue > 0) {
                final groceryItem = CartItem(
                  book: book,
                  quantity: _currentSliderValue,
                  date: (_dueDate.year.toString() +
                      '/' +
                      _dueDate.month.toString() +
                      '/' +
                      _dueDate.day.toString()),
                );
                if (widget.isUpdating) {
                  gm.addItem(groceryItem);
                  Navigator.pop(context);
                } else {
                  gm.addItem(groceryItem);
                  Navigator.pop(context);
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You can\'t add 0 quantity to cart! '),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
            },
          )
        ],
        elevation: 0.0,
        title: Text(
          book.name,
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: topData(),
      )
    );
  }

  Widget topData() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  width: 175,
                  height: 225,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(book.imageURL),
                      fit: BoxFit.cover,
                    ),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: dataShown(),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                buildDateField(context),
                buildQuantityField(),
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  height: 5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),
                InkWell(
                  onTap: () {
                    if (_currentSliderValue > 0) {
                      final groceryItem = CartItem(
                        book: book,
                        quantity: _currentSliderValue,
                        date: (_dueDate.year.toString() +
                            '/' +
                            _dueDate.month.toString() +
                            '/' +
                            _dueDate.day.toString()),
                      );
                      if (widget.isUpdating) {
                        gm.addItem(groceryItem);
                        Navigator.pop(context);
                      } else {
                        gm.addItem(groceryItem);
                        Navigator.pop(context);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('You can\'t add 0 quantity to cart! '),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  },
                  child: BookTabCart(
                    item: CartItem(
                      // id: 'previewMode',
                      book: book,
                      quantity: _currentSliderValue,
                      date: (_dueDate.year.toString() +
                          '/' +
                          _dueDate.month.toString() +
                          '/' +
                          _dueDate.day.toString()),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget dataShown() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 30,
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Book: ',
                  style: GoogleFonts.lato(fontSize: 22.0),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  book.name,
                  style: GoogleFonts.lato(
                      fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Writer: ',
                style: GoogleFonts.lato(fontSize: 22.0),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                book.author,
                style: GoogleFonts.lato(
                    fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Category: ',
                style: GoogleFonts.lato(fontSize: 22.0),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                book.category,
                style: GoogleFonts.lato(
                    fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'year write: ',
                style: GoogleFonts.lato(fontSize: 22.0),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                book.yearWrite,
                style: GoogleFonts.lato(
                    fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'publisher: ',
                style: GoogleFonts.lato(fontSize: 22.0),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              // margin: EdgeInsets.only(top: 10, bottom: 10, left: 20),
              child: Text(
                book.publisher,
                style: GoogleFonts.lato(
                    fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Date added to store: ',
                style: GoogleFonts.lato(fontSize: 22.0),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                book.dateAdd,
                style: GoogleFonts.lato(
                    fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Price: ',
                style: GoogleFonts.lato(fontSize: 26.0),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                book.price.toString(),
                style: GoogleFonts.lato(
                    fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                ' ฿',
                style: GoogleFonts.lato(fontSize: 26.0),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDateField(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 4
              Text(
                'Date receive: ' +
                    '${DateFormat('yyyy-MM-dd').format(_dueDate)}',
                style: GoogleFonts.lato(fontSize: 22.0),
              ),
              TextButton(
                child: const Text('Select'),
                // 6
                onPressed: () async {
                  final currentDate = DateTime.now();
                  // 7
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: currentDate,
                    lastDate: DateTime(currentDate.year + 5),
                  );

                  // 8
                  setState(
                    () {
                      if (selectedDate != null) {
                        _dueDate = selectedDate;
                      }
                    },
                  );
                },
              ),
            ],
          ),
          // 9
        ],
      ),
    );
  }

  Widget buildQuantityField() {
    // 1
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 2
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Quantity',
                style: GoogleFonts.lato(fontSize: 28.0),
              ),
              const SizedBox(width: 16.0),
              Text(
                _currentSliderValue.toInt().toString(),
                style: GoogleFonts.lato(fontSize: 18.0),
              ),
            ],
          ),
          // 3
          Slider(
            // 4
            inactiveColor: _currentColor.withOpacity(0.5),
            activeColor: Colors.blue,
            // 5
            value: _currentSliderValue.toDouble(),
            // 6
            min: 0.0,
            max: 10.0,
            // 7
            divisions: 100,
            // 8
            label: _currentSliderValue.toInt().toString(),
            // 9
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value.toInt();
              });
            },
          ),
        ],
      ),
    );
  }
}
