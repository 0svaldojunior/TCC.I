
// Flutter imports
import 'package:flutter/material.dart';

// App package imports
import 'package:AgesMental/screens/LoginPage.dart';

class NavigationLoginScreen {
  NavigationLoginScreen(BuildContext context) {
    _navigation(context);
  }

  dynamic _navigation(BuildContext context) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage() // No lugar de Profile coloca a página que o botão leva
      )
    );
  }
}