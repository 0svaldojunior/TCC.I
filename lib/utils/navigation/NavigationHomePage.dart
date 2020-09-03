// Flutter imports
import 'package:flutter/material.dart';

// App package imports
import 'package:AgesMental/screens/HomePage.dart';

class NavigationHomePage {
  NavigationHomePage(BuildContext context) {
    _navigation(context);
  }

  dynamic _navigation(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(), 
      )
    );
  }
}