// Flutter imports
import 'package:flutter/material.dart';

// App package imports
import 'package:AgesMental/screens/profile/Profile.dart';

class NavigationProfile {
  NavigationProfile(BuildContext context) {
    _navigation(context);
  }

  dynamic _navigation(BuildContext context) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Profile() // No lugar de Profile coloca a página que o botão leva
      )
    );
  }
}