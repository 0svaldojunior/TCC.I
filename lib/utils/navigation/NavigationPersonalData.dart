// Flutter imports
import 'package:flutter/material.dart';

// App package imports
import 'package:AgesMental/screens/register/PersonalData.dart';

class NavigationPersonalData {
  NavigationPersonalData(BuildContext context) {
    _navigation(context);
  }

  dynamic _navigation(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonalData(), // No lugar de Profile coloca a página que o botão leva
      )
    );
  }
}