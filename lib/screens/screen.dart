import 'package:flutter/material.dart';

import 'explore_screen.dart';
import 'cart_screen.dart';

class Screen {
  static void reset() {
    pages.removeLast();
    pages.add(const CartScreen());
  }

  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    // RecipesScreen(),
    const CartScreen(),
  ];
}