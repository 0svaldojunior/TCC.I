// Flutter imports
import 'package:AgesMental/repositories/auth/AuthenticatorUserLogin.dart';
import 'package:AgesMental/utils/Controllers/UserController.dart';
import 'package:flutter/material.dart';

// App packages imports 
import 'package:AgesMental/model/User.dart';

class ValidatorUserLogin {
  static String validator( BuildContext context ) {
    User users = User();
    users.mail = UserController.mail.text;
    users.password = UserController.password.text;

    if( users.mail.isNotEmpty ) {
      if( users.password.isNotEmpty ) {
        AuthenticatorUserLogin.authenticator( context, users );
        return( AuthenticatorUserLogin.error );
      } else {
        return( "Preencha a senha!" );
      }
    } else {
      return( "O informado não é um e-mail: exemplo@exemplo.com" );
    }
  }
}