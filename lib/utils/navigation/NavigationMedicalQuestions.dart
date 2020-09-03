// Flutter imports
import 'package:flutter/material.dart';

// App package imports
import 'package:AgesMental/screens/register/MedicalQuestions.dart';

class NavigationMedicalQuestions {
  NavigationMedicalQuestions(BuildContext context) {
    _navigation(context);
  }

  dynamic _navigation(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MedicalQuestions() // No lugar de Profile coloca a página que o botão leva
      )
    );
  }
}