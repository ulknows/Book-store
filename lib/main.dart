import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'models/app_state_manager.dart';
import 'navigation/router.dart';
import 'theme_app.dart';

Future main() async{
  FlutterNativeSplash.removeAfter(initialization);
  runApp(BookStore());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 3));
}

class BookStore extends StatefulWidget{
  const BookStore({Key? key}) : super(key: key);

  @override
  State<BookStore> createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;
  final theme = ThemeApp.light();

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(appStateManager: _appStateManager);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _appStateManager),
      ],
      child: MaterialApp(
          theme: theme,
          title: 'Book store',
          debugShowCheckedModeBanner: false,
          home: Router(
            routerDelegate: _appRouter,
            backButtonDispatcher: RootBackButtonDispatcher(),
          )
      ),
    );
  }
}


