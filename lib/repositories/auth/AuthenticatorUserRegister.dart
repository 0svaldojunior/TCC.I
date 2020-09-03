// Imports flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// App packages imports
import 'package:AgesMental/utils/navigation/NavigationWelcomePage.dart';
import 'package:AgesMental/model/User.dart';
import 'package:flutter/material.dart';

class AuthenticatorUserRegister  {
  User _users;
  BuildContext _context;
  AuthenticatorUserRegister(this._context, this._users) {
    _authenticator( _users );
  }

  _authenticator( User users ) {
    // final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    FirebaseAuth auth = FirebaseAuth.instance;
    Firestore database = Firestore.instance;
    // String uid = user.uid.toString();

    auth.createUserWithEmailAndPassword(
      email: users.mail,
      password: users.password
    ).then((firebaseUser) {
      database.collection("users")
        .document( firebaseUser.user.uid )
        .setData( users.toMap() );

      NavigationWelcomePage(_context);
    }).catchError((onError) {
      print("App error: ${onError.toString()}");
    });

  }
}