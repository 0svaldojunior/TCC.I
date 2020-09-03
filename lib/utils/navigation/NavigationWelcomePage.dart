// Flutter imports
import 'package:flutter/material.dart';

// App package imports
import '../../screens/register/WelcomePage.dart';


class NavigationWelcomePage {
  NavigationWelcomePage(BuildContext context) {
    _navigation(context);
  }

  dynamic _navigation(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomePage() // No lugar de Profile coloca a página que o botão leva
      )
    );
  }
}