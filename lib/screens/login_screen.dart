import 'package:flutter/material.dart';

import '../models/user_control.dart';

class Login extends StatefulWidget {
  static User_Control user = User_Control();
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          textAlign: TextAlign.center,
        ),
      ),
      body: LoginCheck(),
    );
  }

  Widget LoginCheck() {
    if (User_Control.loggedIn) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 30,left: 20, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20, bottom: 40),
                    child: CircleAvatar(

                      backgroundColor: Colors.white,
                      child: Image.asset('assets/person_icon.png')

                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('User : ' + User_Control.userLoggedIn, style: TextStyle(fontSize: 30)),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (User_Control.loggedIn) {
                User_Control.loggedIn = false;
              }
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Logout'),
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(
        child: Column(
          children: [
            LoginInput(),
            InkWell(
              onTap: () {
                if (!User_Control.loggedIn) {
                  if (LoginInput.username.text != '' &&
                      LoginInput.password.text != '') {
                    User_Control.Login(LoginInput.username.text);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login Success! Welcome back ' + User_Control.getCurrentUser, style: TextStyle(color: Colors.black),),
                        backgroundColor: Colors.greenAccent,
                      ),
                    );
                  } else if (LoginInput.username.text == '' &&
                      LoginInput.password.text != '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please input username to login!'),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  } else if (LoginInput.password.text == '' &&
                      LoginInput.username.text != '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please input password to login!'),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Please input username and password to login!'),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text('Login'),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}

class LoginInput extends StatelessWidget {
  static var username = TextEditingController();
  static var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset('assets/cart_assets/empty_cart.png', height: 100, width: 100,),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            child: Text('Book Store Login',style: TextStyle(fontSize: 30),),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            controller: LoginInput.username,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Username',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            obscureText: true,
            controller: LoginInput.password,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
            ),
          ),
        )
      ],
    );
  }
}
