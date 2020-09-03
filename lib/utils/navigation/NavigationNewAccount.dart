// Flutter imports
import 'package:flutter/material.dart';

// App package imports
import '../../screens/register/BasicInformation.dart';

class NavigationNewAccount {
  NavigationNewAccount(BuildContext context) {
    _navigation(context);
  }

  dynamic _navigation(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BasicInformation()
      )
    );
  }
}