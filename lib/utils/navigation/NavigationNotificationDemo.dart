// Flutter imports
import 'package:flutter/material.dart';

// App package imports
import 'package:AgesMental/screens//Notifications.dart';

class NavigationNotificationDemo {
  NavigationNotificationDemo(BuildContext context) {
    _navigation(context);
  }

  dynamic _navigation(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Notifications(), // No lugar de Profile coloca a página que o botão leva
      )
    );
  }
}