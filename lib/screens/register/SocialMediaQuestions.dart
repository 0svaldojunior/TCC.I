//Flutter imports
import 'package:AgesMental/utils/buttons/dropdown/SingleMenuDropDown.dart';
import 'package:AgesMental/utils/navigation/NavigationProfile.dart';
import 'package:flutter/material.dart';
//Packages App imports
import 'package:AgesMental/utils/buttons/Buttons.dart';
import 'package:AgesMental/utils/buttons/DropDownButton.dart';

class SocialMediaQuestions extends StatefulWidget {
  @override
  _SocialMediaQuestionsState createState() => _SocialMediaQuestionsState();
}

class _SocialMediaQuestionsState extends State<SocialMediaQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Text("Midias Sociais"),
        backgroundColor: Colors.black45,
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
            height: 2100.0,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding( padding: EdgeInsets.fromLTRB(70, 45, 70, 0),),
                Text(
                  "Sobre Redes Sociais",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,                
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
                  child: Text(
                    "Abaixo teremos as perguntas referentes ao seu seu uso das redes sociais. Marque as afirmações conforme A SUA ESCOLHA.", 
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Gostaria que as Redes Sociais me informassem quando eu ficar muito tempo online.", ["SIM", "NÃO"]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Gostaria que as Redes Sociais me informassem quando eu ficar muito tempo online.", ["SIM", "NÃO"]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Gostaria que as Redes Sociais me informassem quais fotos postadas foram manipuladas.", ["SIM", "NÃO"]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Gostaria que as redes sociais pudessem identificar pessoas com risco de desenvolver transtornos mentais e/ou atentar contra a própria vida.", ["SIM", "NÃO"]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Gostaria que as redes sociais oferecessem suporte à esses indivíduos.", ["SIM", "NÃO"]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Acredito que sou mais feliz no ambiente online do que na vida real.", ["SIM", "NÃO"]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Acredito que sou dependente/viciado em alguma rede social.", ["SIM", "NÃO"]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Durante os últimos 30 dias, com que frequência você não conseguiu pegar no sono em menos de 30 minutos.", 
                  [
                    "Uma vez por semana", 
                    "Duas a Três vezes por semana", 
                    "Quatro a cinco vezes por semana", 
                    "Entre seis e sete vezes por semana"
                  ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Durante os últimos 30 dias, com que frequência você acordou no meio da noite?",
                    [
                      "Uma vez por semana",
                      "Duas a Três vezes por semana", 
                      "Quatro a cinco vezes por semana", 
                      "Entre seis e sete vezes por semana"
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Durante os últimos 30 dias, como você avalia a qualidade de seu sono?",
                    [
                      "Boa!",
                      "Regular."
                      "Ruim."
                    ], 
                  ),
                ),
                
                // AQUI PRECISA SER UM CAMPO DE HORA
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Em um dia de semana (segunda à sexta), quantas horas você gasta com redes sociais e aplicativos de comunicação (Facebook, Instagram, etc)?",
                    [
                      "AQUI IRAO HORAS, NAO UM DROPDOWN"
                    ], 
                  ),
                ),


                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Quão prejudicial você considera as “curtidas/likes” das redes sociais?",
                    [
                      "Muito prejudiciais.",
                      "Pouco prejudiciais.",
                      "Nada prejudiciais."
                    ], 
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Quão prejudicial você considera o uso de filtros e ferramentas de edição de imagem (e.g. Photoshop) nas fotos postadas em redes sociais?",
                    [
                      "Muito prejudiciais.",
                      "Pouco prejudiciais.",
                      "Nada prejudiciais."
                    ], 
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: Text(
                    "Pensando em sua experiência pessoal, até que ponto o uso das redes sociais (Facebook, Instagram, Snapchat, Twitter, YouTube, WhatsApp) melhoram ou pioram os seguintes aspectos de sua saúde e vida social:", 
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Ter acesso a informações de saúde de profissionais confiáveis.",
                    ["1", "2", "3", "4", "5"], 
                  ),
                ),            
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Capacidade de conhecer e compreender melhor as experiências relacionadas à saúde de outras pessoas.",
                    ["1", "2", "3", "4", "5"], 
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Ter acesso a suporte emocional",
                    ["1", "2", "3", "4", "5"], 
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Ansiedade (preocupações, nervosismo, sensação de desconforto)",
                    ["1", "2", "3", "4", "5"], 
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Depressão (se sentir triste e/ou para baixo)",
                    ["1", "2", "3", "4", "5"], 
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Solidão (sentir que está por conta própria no mundo)",
                    ["1", "2", "3", "4", "5"], 
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Capacidade de expressar seus sentimentos, pensamentos ou ideias",
                    ["1", "2", "3", "4", "5"], 
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Capacidade de conhecer melhor a si mesmo",
                    ["1", "2", "3", "4", "5"], 
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Visão sobre sua imagem corporal",
                    ["1", "2", "3", "4", "5"], 
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Cultivo de relacionamentos com pessoas que conhece pessoalmente",
                    ["1", "2", "3", "4", "5"], 
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Capacidade de se sentir parte de um grupo de pessoas que pensam como você",
                    ["1", "2", "3", "4", "5"], 
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 20, 0),
                  child: 
                  SingleMenuDropDown("Sentimento de que precisa estar conectado porque fica preocupado que eventos sociais e/ou atividades de lazer estejam ocorrendo sem que vocêpossa comparecer e/ou desfrutar",
                    ["1", "2", "3", "4", "5"], 
                  ),
                ),
                Column(
                  children: 
                  <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Buttons.gradientButton("FINALIZAR", _navitagion)
                    ,)                      
                  ],
                ),
              ],
           )
        ],
      ),
    );
  }

  void _navitagion() {
    NavigationProfile(context);
  }
}