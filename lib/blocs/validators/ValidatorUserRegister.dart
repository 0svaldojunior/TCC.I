// Flutter imports
import 'package:flutter/material.dart';

// App packages imports 
import 'package:AgesMental/model/User.dart';
import 'package:AgesMental/repositories/auth/AuthenticatorUserRegister.dart';
import 'package:AgesMental/utils/Controllers/UserController.dart';

class ValidatorUserRegister {
  static String validator(BuildContext context) {
    User users = User();
    users.name = UserController.name.text;
    users.mail = UserController.mail.text;
    users.phone = UserController.phone.text;
    users.password = UserController.password.text;

    if( users.name.length >= 3 ) {
      if( users.mail.length >= 5 && users.mail.contains("@")  && users.mail.contains(".") ) {
        if( users.phone.length>= 8 ) {
          if( users.password.length >= 5 ) {
            AuthenticatorUserRegister( context, users );
            return ( "Success" );
          } else {
            return ( "A senha deve conter ao menos 5 caracteres" );
          }
        } else {
          return ( "Número inválido, exemplo: DDD 0000 0000" );
        }
      } else {
        return ( "O informado não é um e-mail: exemplo@exemplo.com" );
      }
    } else {
      return ( "Nome precisa ao de menos de 3 caracteres" );
    }
  }
}