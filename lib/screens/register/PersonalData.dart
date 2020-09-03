//Flutter imports
import 'package:flutter/material.dart';

//Packages App imports
import 'package:AgesMental/utils/buttons/Buttons.dart';
import 'package:AgesMental/utils/forms/NameForm.dart';
import 'package:AgesMental/utils/forms/NumberForm.dart';
import 'package:AgesMental/utils/buttons/SimpleText.dart';
import 'package:AgesMental/utils/Controllers/UserController.dart';
import 'package:AgesMental/utils/buttons/dropdown/SingleMenuDropDown.dart';
import 'package:AgesMental/utils/navigation/NavigationMedicalQuestions.dart';

class PersonalData extends StatefulWidget{
  @override
  _PersonalDataState createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados Pessoais"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body:_body(),
    );
  }

  _body(){
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"), fit: BoxFit.cover, 
          ),
        ),
        child: Column(
          children: <Widget>[ 
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: SimpleText.text("Identifique-se!", 40, Colors.white, weight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: SimpleText.registerText(
                "Aqui teremos as nossas perguntas de identificação, todas são de resposta obrigatória.", 
                14,// font size
                Colors.white, //font color
              ),
            ),
            NumberForm("Qual sua idade?", "Preencha com a sua idade!", 15, 40, 15, 20),
            NameForm("Qual a sua cidade?", "Cidade é uma informação obrigatória!", 15, 5, 15, 20, UserController.city, TextInputType.text),
            NameForm("Qual sua nacionalidade?", "Nacionalidade é uma informação obrigatória!", 15, 5, 15, 20, UserController.nasc, TextInputType.text),
            NumberForm("Qual seu telefone?", "Telefone é uma informação obrigatória!", 15, 5, 15, 20),
            NameForm("Qual a sua profissão?", "Profissão é uma informação obrigatória!", 15, 5, 15, 20, UserController.job, TextInputType.text),
            SingleMenuDropDown(
              "Qual raça/cor você se considera?", 
              [
                "Branca",
                "Preta",
                "Parda",
                "Amarela",
                "Indigena",
                "Outra",
              ]
            ),
            SingleMenuDropDown(
              "Qual seu estado civil?", 
              [
                "Solteiro",
                "Casado",
                "Divorciado",
                "Viúvo",
                "Separado",
              ] 
            ),
            SingleMenuDropDown(
              "Com quem você mora?", 
              [
                "Sozinho",
                "Pais",
                "Avós",
                "Esposa",
                "Filhos",
              ]
            ),
            SingleMenuDropDown(
              "Qual seu grau de instrução?", 
              [
                "Fundamental - Incompleto",
                "Fundamental - Completo",
                "Médio - Incompleto",
                "Médio - Completo",
                "Superior - Incompleto",
                "Superior - Completo",
                "Pós-graduação (Lato senso) - Incompleto",
                "Pós-graduação (Lato senso) - Completo",
                "Pós-graduação (Lato sensu, nível mestrado) - Incompleto",
                "Pós-graduação (Lato sensu, nível mestrado) - Completo",
                "Pós-graduação (Lato sensu, nível doutor) - Incompleto",
                "Pós-graduação (Lato sensu, nível doutor) - Completo",
              ]
            ),
            SingleMenuDropDown(
              "Qual é o grau de instrução do chefe da família?", 
              [
                "Fundamental - Incompleto",
                "Fundamental - Completo",
                "Médio - Incompleto",
                "Médio - Completo",
                "Superior - Incompleto",
                "Superior - Completo",
                "Pós-graduação (Lato senso) - Incompleto",
                "Pós-graduação (Lato senso) - Completo",
                "Pós-graduação (Lato sensu, nível mestrado) - Incompleto",
                "Pós-graduação (Lato sensu, nível mestrado) - Completo",
                "Pós-graduação (Lato sensu, nível doutor) - Incompleto",
                "Pós-graduação (Lato sensu, nível doutor) - Completo",
              ] 
            ),
            NumberForm("Qual a renda mensal da sua família?", "Essa é uma informação obrigatória!", 15, 5, 15, 40),
            Buttons.gradientButton("CONTINUAR", _navigation),
            SizedBox(height: 40,)
          ]
        ),
      ),
    );
  }

  void _navigation(){
    NavigationMedicalQuestions(context);
  }
}