// Flutter imports
import 'package:flutter/material.dart';

// App package imports
import 'package:AgesMental/screens/LoginPage.dart';

class NavigationLogout {
  NavigationLogout(BuildContext context) {
    _navigation(context);
  }

  dynamic _navigation(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage()
      )
    );
  }
}