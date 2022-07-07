import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/models.dart';

class MockDataService {
  Future<ExploreData> getExploreData() async {
    final allBook = await _getBook();

    return ExploreData(allBook);
  }

  Future<List<Book>> _getBook() async {
    await Future.delayed(const Duration(milliseconds: 300));
    // final dataStr = '{"books":[{"id":1,"name":"Wayslight","category":"Novel","pages":153,"dateAdd":"2022/02/05","yearWrite":"2021","author":"SarawutPrakobkij","publisher":"BoyPrint","isbn":"5073753932041094","price":109.00,"imageURL":"assets/bookImage/bookImg1.png"},{"id":2,"name":"5Kings","category":"Diary","pages":90,"dateAdd":"2022/04/12","yearWrite":"2019","author":"KittikunKredgatok","publisher":"KingPub","isbn":"8326392185931234","price":89.00,"imageURL":"assets/bookImage/bookImg12.png"},{"id":3,"name":"5Kings","category":"Diary","pages":90,"dateAdd":"2022/04/12","yearWrite":"2019","author":"KittikunKredgatok","publisher":"KingPub","isbn":"8326392185931234","price":89.00,"imageURL":"assets/bookImage/bookImg13.png"},{"id":4,"name":"5Kings","category":"Diary","pages":90,"dateAdd":"2022/04/12","yearWrite":"2019","author":"KittikunKredgatok","publisher":"KingPub","isbn":"8326392185931234","price":89.00,"imageURL":"assets/bookImage/bookImg14.png"}]}';
    final dataString = await _loadAsset(
      'assets/data/books_data.json',
    );
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['books'] != null) {
      final books = <Book>[];
      json['books'].forEach((v) {
        books.add(Book.fromJson(v));
      });
      return books;
    } else {
      return [];
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }

}
