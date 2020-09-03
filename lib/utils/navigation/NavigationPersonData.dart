// Flutter imports
import 'package:AgesMental/screens/register/PersonalData.dart';
import 'package:flutter/material.dart';

// App package imports

class NavigationPersonData {
  NavigationPersonData(BuildContext context) {
    _navigation(context);
  }

  dynamic _navigation(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonalData() // No lugar de Profile coloca a página que o botão leva
      )
    );
  }
}