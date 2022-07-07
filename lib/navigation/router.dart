import 'package:flutter/material.dart';
import 'package:fooderlich/screens/book_detail_screen.dart';
import 'package:fooderlich/screens/empty_cart_screen.dart';

import '../home.dart';
import '../models/app_state_manager.dart';
import '../models/page.dart';

// 1
class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  // 2
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  // 3
  final AppStateManager appStateManager;

  AppRouter({
    required this.appStateManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    // TODO: Add Listeners
    appStateManager.addListener(notifyListeners);
  }

  // TODO: Dispose listeners
  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);

    super.dispose();
  }

  // 6
  @override
  Widget build(BuildContext context) {
    // 7
    return Navigator(
      // 8
      key: navigatorKey,
      // TODO: Add onPopPage
      onPopPage: _handlePopPage,
      // 9
      pages: [
        Home.page(),
        if (appStateManager.getCart == true) EmptyCartScreen.page(),
        if (appStateManager.getDetail == true)
          BookDetailScreen.page(appStateManager.getBook, appStateManager.getKey),
      ],
    );
  }

  // TODO: Add _handlePopPage
  bool _handlePopPage(
      // 1
      Route<dynamic> route,
      // 2
      result) {
    // 3
    if (!route.didPop(result)) {
      // 4
      return false;
    }

    if (route.settings.name == Pages.book_detail) {
      appStateManager.outFormDetail();
    }

    // TODO: Handle state when user closes grocery item screen
    if (route.settings.name == Pages.cart) {
      appStateManager.outFormCart();
    }
    return true;
  }

  // 10
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
