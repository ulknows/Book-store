class User_Control {
  static bool loggedIn = false;
  static String userLoggedIn = '';

  static void Login(username) {
    User_Control.userLoggedIn = username;
    User_Control.loggedIn = true;
  }

  static get getCurrentUser => userLoggedIn;
}