//Flutter imports
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//Packages App imports
import 'package:AgesMental/repositories/auth/AuthenticatorUserLogin.dart';
import 'package:AgesMental/utils/navigation/NavigationNewAccount.dart';
import 'package:AgesMental/utils/navigation/NavigationProfile.dart';
import 'package:AgesMental/utils/Controllers/UserController.dart';
import 'package:AgesMental/utils/forms/PasswordForm.dart';
import 'package:AgesMental/utils/forms/EmailForm.dart';
import 'package:AgesMental/utils/buttons/SimpleText.dart';
import 'package:AgesMental/utils/buttons/Buttons.dart';
import 'package:AgesMental/model/User.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User users = User();
  String _error = "";
  Color _colorError = Colors.red;

  @override
  void initState() {
    AuthenticatorUserLogin.verifyLoginUser(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _stackBody(context),
    );
  }

  _loginUser() {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.signInWithEmailAndPassword(
      email: users.mail, 
      password: users.password
    ).then((value) {
      NavigationProfile(context);
    }).catchError((onError) {
      _colorError = Colors.red;
      setState(() {
        _error = "Erro de autenticação, verifique e-mail e senha e tente novamente!";
      });
    });
  }

  _validator() {
    users.mail = UserController.mail.text;
    users.password = UserController.password.text;
    if( users.mail.isNotEmpty ) {
      if( users.password.isNotEmpty ) {
        setState(() {
          _colorError = Colors.green;
          _error = "Success";
        });

        AuthenticatorUserLogin.authenticator( context, users );
        _error = AuthenticatorUserLogin.error;
      } else {
        setState(() {
          _colorError = Colors.red;
          _error = "Preencha a senha!";
        });
      }
    } else {
      setState(() {
        _colorError = Colors.red;
        _error = "O informado não é um e-mail: exemplo@exemplo.com";
      });
    }
  }

  _stackBody(BuildContext context) {
    return SingleChildScrollView(
			padding: EdgeInsets.zero,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Image.asset(
            "images/background.png",
            fit: BoxFit.cover,
            height: 1000.0,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 80, 0, 0),     
                child: Image.asset(
                  "images/circular_icon.png",
                  fit: BoxFit.scaleDown,
                  height: 200.0,
                ),
              ),
              SizedBox(height: 40),
              SimpleText.text("Bem-Vindo!", 13, Colors.white),
              SimpleText.text("Por favor, logue-se para continuar.", 13, Colors.white),
              EmailForm("E-mail", "Preencha com seu e-mail", 50.0, 10.0, 50.0, 10.0, UserController.mail),
              PasswordForm("Password", "Fill in the password field", 50.0, 10.0, 50.0, 10.0, UserController.password),
              Buttons.gradientButton("LOGAR", _validator),

              Text(
                _error,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _colorError,
                  fontSize: 20
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SimpleText.text("Não possui uma conta?", 12, Colors.white, weight: FontWeight.bold),
                  Buttons.flatButton("Crie uma", () => NavigationNewAccount(context))
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}
