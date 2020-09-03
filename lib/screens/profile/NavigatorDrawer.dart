import 'package:AgesMental/utils/navigation/NavigationLoginScreen.dart';
import 'package:AgesMental/utils/navigation/NavigationMedicalQuestions.dart';
import 'package:AgesMental/utils/navigation/NavigationPersonData.dart';
import "package:AgesMental/utils/navigation/NavigationProfile.dart";
import 'package:AgesMental/utils/navigation/NavigationSocialQuestions.dart';
import 'package:AgesMental/utils/navigation/NavigationNotificationDemo.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class NavigatorDrawer extends StatefulWidget {
  @override
  _NavigatorDrawerState createState() => _NavigatorDrawerState();
}

class _NavigatorDrawerState extends State<NavigatorDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              "Menu",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text("Bem Vindo"),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text("Perfil"),
            onTap: () => NavigationProfile(context),
          ),
          ListTile(
            leading: Icon(Icons.healing),
            title: Text("Dados Médicos"),
            onTap: () => NavigationMedicalQuestions(context),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Dados Pessoais"),
            onTap: () => NavigationPersonData(context),
          ),
          ListTile(
            leading: Icon(Icons.radio_button_checked),
            title: Text("Dados de Midia Sociais"),
            onTap: () => NavigationSocialQuestions(context),
          ),
          ListTile(
            leading: Icon(Icons.radio_button_checked),
            title: Text("Pergunta Demo"),
            onTap: () => NavigationNotificationDemo(context),
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text("Feedback"),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            title: Text(
              "Deslogar",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold
              ),
            ),
            onTap: _singOut,
          ),
        ],
      ),
    );
  }

  void _singOut() {
    FirebaseAuth auth = FirebaseAuth.instance;
    setState(() {
      auth.signOut();
      NavigationLoginScreen( context );
    });
  }
}