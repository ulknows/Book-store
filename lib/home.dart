import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fooderlich/screens/explore_screen.dart';
import 'package:fooderlich/screens/login_screen.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'screens/cart_screen.dart';
import 'screens/screen.dart';

class Home extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Pages.home,
      key: ValueKey(Pages.home),
      child: Home(),
    );
  }
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // @override
  // void initState() {
  // //   // TODO: implement initState
  //   super.initState();
    // Future.delayed(Duration(seconds: 3), () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false));
  // }

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
    // return Container(
    //   child: Text('Loading'),
    // );
  }


}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
          title: Text(
            'Book Store',
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            Row(
              children: [
                Container(child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Icon(Icons.account_circle_outlined)),
                )),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartScreen()),
                          );
                        },
                        child: Icon(Icons.shopping_cart_outlined)),
                  ),
                )
              ],
            )
          ],
        ),
        body: ExploreScreen(),

      );

  }
}

