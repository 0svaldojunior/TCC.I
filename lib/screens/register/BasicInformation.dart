//Flutter imports
import 'package:flutter/material.dart';

//Packages App imports
import 'package:AgesMental/utils/forms/NameForm.dart';
import 'package:AgesMental/utils/forms/EmailForm.dart';
import 'package:AgesMental/utils/buttons/Buttons.dart';
import 'package:AgesMental/utils/forms/PasswordForm.dart';
import 'package:AgesMental/utils/buttons/SimpleText.dart';
import 'package:AgesMental/utils/buttons/CheckBoxWidget.dart';
import 'package:AgesMental/utils/Controllers/UserController.dart';
import 'package:AgesMental/utils/navigation/NavigationNewAccount.dart';
import 'package:AgesMental/blocs/validators/ValidatorUserRegister.dart';
import 'package:AgesMental/utils/navigation/NavigationPersonalData.dart';

class BasicInformation extends StatefulWidget {
  @override
  _BasicInformationState createState() => _BasicInformationState();
}

class _BasicInformationState extends State<BasicInformation> {
  String _error = "";
  bool _isCheck = false;
  Color _colorError = Colors.red;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registre-se!"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body:_body(),
    );
    
  }
  
  _validator() {
    _error = ValidatorUserRegister.validator(context);
    if(_error == "Success") {
      setState(() {
        _colorError = Colors.green;
        _error = _error;
        NavigationPersonalData(context);
      });
    } else {
      setState(() {
        _colorError = Colors.red;
        _error = _error;
      });
    }
  }
   
   //Body alterado somente para teste + fluxo de telas (não nescessário para o merge)
  _body(){
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Stack(
        children: <Widget>[
          Image.asset(
            "images/background.png",
            fit: BoxFit.cover,
            height: 1000.0,
          ),

          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: SimpleText.text("Cadastro Inicial", 40, Colors.white, weight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
                child: SimpleText.registerText(
                  "O cadastro a seguir levará de 10 a 20 minutos, tenha clareza para responder esse questionário em um momento calmo e sem distrações", 
                  14,// font size
                  Colors.white, //font color
                ),
              ),
              NameForm("Nome Completo", "Preencha seu nome!", 15, 40, 15, 20, UserController.name, TextInputType.text),
              EmailForm("Seu melhor e-mail", "E-mail é uma informação obrigatórioa!", 15, 5, 15, 20, UserController.mail),
              NameForm("Coloque seu Whatsapp", "Número de Celular com DDD!", 15, 5, 15, 20, UserController.phone, TextInputType.phone),
              PasswordForm("Sua senha", "Senha é obrigatório!", 15, 5, 15, 20, UserController.password),
              Row(
                children: <Widget>[
                  CheckBoxWidget(_isCheck, 70, 10, 0, 3),
                  
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
                    child: SimpleText.text("Eu aceito os", 12, Colors.white, weight: FontWeight.bold),
                  ),
                   
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 2),                    
                    child: Buttons.flatButton("Termos e condições.", () => NavigationNewAccount(context)),
                  ),
                   // botão
                ],
              ),
              Buttons.gradientButton("CONTINUAR", _validator),
              SimpleText.text(_error, 15, _colorError),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(120, 0, 0, 0),
                      child: 
                        SimpleText.text("Já possui uma conta?", 12, Colors.white, weight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Buttons.flatButton("Faça Login!", null)
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}