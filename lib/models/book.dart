class BookCardType {
  static const card1 = 'Novel';
  static const card2 = 'Horror';
  static const card3 = 'IDK';
}

class Book {
  int id;
  String name;
  String category;
  int pages;
  String dateAdd;
  String yearWrite;
  String author;
  String publisher;
  String isbn;
  double price;
  String imageURL;

  Book(
      {required this.id,
        required this.name,
        required this.category,
        required this.pages,
        required this.dateAdd,
        required this.yearWrite,
        required this.author,
        required this.publisher,
        required this.isbn,
        required this.price,
        required this.imageURL});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      pages: json['pages'] ?? 0,
      dateAdd: json['dateAdd'] ?? '',
      yearWrite: json['yearWrite'] ?? '',
      author: json['author'] ?? '',
      publisher: json['publisher'] ?? '',
      isbn: json['isbn'] ?? '',
      price: json['price'] ?? 0,
      imageURL: json['imageURL'] ?? '',
    );
  }

  String get() {
    return id.toString() +
        name +
        category +
        pages.toString() +
        dateAdd +
        yearWrite +
        author +
        publisher +
        isbn +
        price.toString() +
        imageURL;
  }

  Map toJson() => {
    'id': id,
    'name': name,
    'category': category,
    'pages': pages,
    'dateAdd': dateAdd,
    'yearWrite': yearWrite,
    'author': author,
    'publisher': publisher,
    'isbn': isbn,
    'price': price,
    'imageURL': imageURL

  };
}
