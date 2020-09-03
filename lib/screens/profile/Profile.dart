// Flutter imports
import 'package:AgesMental/utils/buttons/dropdown/XOptionMenuDropDown.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:AgesMental/screens/notificationManager.dart';
import 'package:AgesMental/screens/profile/NavigatorDrawer.dart';
import 'package:AgesMental/utils/buttons/Buttons.dart';
//Packages App imports
// App package imports
import 'package:AgesMental/utils/buttons/dropdown/MultiMenuAllNoneDropDown.dart';
import 'package:AgesMental/utils/buttons/dropdown/SingleMenuDropDown.dart';
import 'package:AgesMental/utils/buttons/dropdown/MultiMenuDropDown.dart';
import 'package:AgesMental/utils/buttons/dropdown/XOptionDropDown.dart';
import 'package:AgesMental/utils/buttons/dropdown/SingleDropDown.dart';
import 'package:AgesMental/utils/buttons/dropdown/MultiDropDown.dart';
import 'package:AgesMental/screens/profile/NavigatorDrawer.dart';

NotificationManager n = new NotificationManager();


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _userName = "";
  String _userMail = "";
  
  Future _userData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser loggedUser = await auth.currentUser();

    setState(() {
      _userMail = loggedUser.email;
      _userName = loggedUser.toString();
    });
  }
  
  @override
  void initState() {
    _userData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigatorDrawer(),
      appBar: AppBar(
        title: Text("Perfil"),
        backgroundColor: Colors.black45,
      ),
      backgroundColor: Color.fromRGBO(41, 48, 59, 100.0),
      body: _body()
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Stack(
        // alignment: Alignment.center,
        children: [
          Image.asset(
            "images/background.png",
            fit: BoxFit.cover,
            height: 1000.0,
          ),

          Column(
            children: [
              Text(
                "Bem vindo $_userMail",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: SingleDropDown("Pergunta: SingleDropDown", ["Opção 1", "Opção 2", "Opção 3", "Opção 4", "Opção 5"])
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: MultiDropDown("Pergunta: MultiDropDown", ["Opção 1", "Opção 2", "Opção 3", "Opção 4", "Opção 5"])
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: XOptionDropDown("Pergunta: XOptionDropDown", ["Opção 1", "Opção 2", "Opção 3", "Opção 4", "Opção 5"], 3)
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: SingleMenuDropDown("Pergunta: SingleMenuDropDown", ["Opção 1", "Opção 2", "Opção 3", "Opção 4", "Opção 5"])
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: MultiMenuDropDown("Pergunta: MultiMenuDropDown", ["Opção 1", "Opção 2", "Opção 3", "Opção 4", "Opção 5"])
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: MultiMenuAllNoneDropDown("Pergunta: MultiMenuAllNoneDropDown", ["Opção 1", "Opção 2", "Opção 3", "Opção 4", "Opção 5"])
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: XOptionMenuDropDown("Pergunta: XOptionMenuDropDown", ["Opção 1", "Opção 2", "Opção 3", "Opção 4", "Opção 5"], 3)
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Buttons.gradientButton("Notificar", () => notificate()),
              ),
            ],
          )
        ],
      ),
    );
  }
}

void notificate()
{
  n.initNotificationManager();
  n.showNotificationWithDefaultSound("Verifique o aplicativo Bem-Estar", "Perguntas Diarias Prontas");
  return;
}