//Flutter imports
import 'package:flutter/material.dart';

//Packages App imports
import 'package:AgesMental/utils/buttons/Buttons.dart';
import 'package:AgesMental/utils/navigation/NavigationPersonalData.dart';

class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[700],
      appBar: AppBar(
        title: Text(
          "Seja Bem-Vindo!",
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
                
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),     
                  child: Text(
                    "\nPrezado participante, este questionário tem como objetivo conhecer o seu perfilsociodemográfico, tais dados auxiliarão na construção desta pesquisa. \n\n    > Todas as questões visam apenas à coleta de informações ou de opiniões. Não há respostas certas ou erradas. Portanto, por favor, não deixe  nenhuma questão sem resposta. É de fundamental importância sua atenção a todas as questões. \n\n    > Todos os dados obtidos deste questionário serão CONFIDENCIAIS.\n\nO questionario consiste em 3 principais quadrantes, dados de identificação, dados médicos e questionário de utilização. Tenha em mente que você precisa responder todas as perguntas e elas levarão em torno de 20 minutos.\n",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,                      
                      fontWeight: FontWeight.normal,                
                    ),
                  ),
                ), 
                
                Buttons.gradientButton("PROSSEGUIR", () => NavigationPersonalData(context)),
              ],
            )
        ],
      ),
    );
  }
}