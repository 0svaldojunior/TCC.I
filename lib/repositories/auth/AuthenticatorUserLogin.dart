// Imports flutter
import 'package:firebase_auth/firebase_auth.dart';

// App packages imports
import 'package:AgesMental/utils/navigation/NavigationProfile.dart';
import 'package:AgesMental/model/User.dart';
import 'package:flutter/material.dart';

class AuthenticatorUserLogin  {
  static String error = "";

  Future<String> inputData() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid.toString();
    return uid;
  }

  static Future verifyLoginUser( BuildContext context ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser loggedUser = await auth.currentUser();

    if( loggedUser != null ) {
      NavigationProfile(context);
    }
  }

  static dynamic authenticator( BuildContext context, User users ) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.signInWithEmailAndPassword(
      email: users.mail, 
      password: users.password
    ).then((value) {
      AuthenticatorUserLogin.error = "Success";
      NavigationProfile(context);
    }).catchError((onError) {
      AuthenticatorUserLogin.error = "Erro de autenticação, verifique e-mail e senha e tente novamente!";
    });
  }
  
}