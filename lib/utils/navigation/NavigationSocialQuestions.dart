// Flutter Imports
import 'package:flutter/material.dart';

//App package imports
import 'package:AgesMental/screens/register/SocialMediaQuestions.dart';

class NavigationSocialQuestions {
  NavigationSocialQuestions(BuildContext context){
    _navigation(context);
  }

  dynamic _navigation(BuildContext context){
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SocialMediaQuestions(),
      ),
    );
  }
}