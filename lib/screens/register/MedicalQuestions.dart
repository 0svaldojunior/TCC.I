//Flutter imports

import 'package:AgesMental/utils/navigation/NavigationSocialQuestions.dart';
import 'package:flutter/material.dart';

//Packages App imports
import 'package:AgesMental/utils/buttons/Buttons.dart';
import 'package:AgesMental/utils/forms/AdjustableTextForm.dart';
import 'package:AgesMental/utils/buttons/dropdown/SingleMenuDropDown.dart';

class MedicalQuestions extends StatefulWidget {
  @override
  _MedicalQuestionsState createState() => _MedicalQuestionsState();
}

class _MedicalQuestionsState extends State<MedicalQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dados Médicos",
          textAlign: TextAlign.center,
          style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
          ),
         ),
        backgroundColor: Colors.black,
      ),
      body:_body(context),
    );
  }

  _body(BuildContext context){
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
                //Padding( padding: EdgeInsets.fromLTRB(70, 45, 70, 0),),

                Padding(
                  padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                  child: Text(
                    "Aqui teremos as nossas perguntas de identificação, todas são de resposta obrigatória.", 
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),

            
                SingleMenuDropDown("Possui ou já possuiu alguma doença psiquiátrica diagnosticada?", ["SIM", "NÃO"]),
                AdjustableTextForm("   Qual doença?", "Diga o nome da sua doença caso tenha.", [16, 15, 16, 0], TextInputType.text),
                AdjustableTextForm("   Há quanto tempo você recebeu o diagnóstico?", "Digite a quantidade de tempo em MESES!", [16, 15, 16, 15], TextInputType.number),
                SingleMenuDropDown("Já passou por uma internação psiquiátrica?", ["SIM", "NÃO"]),
                AdjustableTextForm("   Quantos anos você tinha?", "Digite apenas a idade!", [16, 15, 16, 15], TextInputType.number),
                SingleMenuDropDown("Você tem algum familiar com diagnóstico de transtorno mental?", ["SIM", "NÃO"]),
                AdjustableTextForm("   Qual transtorno?", "Diga o nome do transtorno caso o familiar tenha.", [16, 15, 16, 15], TextInputType.text),
                SingleMenuDropDown("Você usou drogas nos últimos 30 dias?", ["SIM", "NÃO"]),
                AdjustableTextForm("   Qual droga?", "Diga o nome da droga caso tenha usado.", [16, 15, 16, 25], TextInputType.text),

                Buttons.gradientButton("CONTINUAR", _navigation),
              ],
           )
        ],
      ),
    );
  }

  void _navigation() {
    NavigationSocialQuestions(context);
  }
}