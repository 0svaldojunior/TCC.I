//Flutter imports
import 'package:flutter/material.dart';

//Packages App imports
import 'package:AgesMental/utils/navigation/NavigationProfile.dart';

class Notifications extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[700],
      appBar: AppBar(
        title: Text(
          "Questionário Diário",
          textAlign: TextAlign.center,
          style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,                      
                      fontWeight: FontWeight.normal,                
          ),
         ),
        backgroundColor: Colors.indigo[800],
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
                  padding: EdgeInsets.fromLTRB(25, 115, 25, 25),
                  child: Text(
                    "Como você está se sentindo hoje?", 
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: iconButton(Icons.sentiment_very_satisfied,"Muito Feliz", null, context, [18,0,18,0]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: iconButton(Icons.sentiment_satisfied,"Feliz", null, context, [47,0,47,0]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: iconButton(Icons.sentiment_neutral,"Normal", null, context, [36,0,36,0]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: iconButton(Icons.sentiment_dissatisfied,"Triste", null, context, [45,0,45,0]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: iconButton(Icons.sentiment_very_dissatisfied,"Muito triste", null, context, [18,0,18,0]),
                ),
                
              ],
           )
        ],
      ),
    );
  }

   static iconButton(IconData _iconType, String _text, Function _onPressed, BuildContext context, List<double> _padding) {
    return RaisedButton.icon(
      onPressed: () {
        //_onPressed,
        messageSent(context);
      },
      padding: EdgeInsets.fromLTRB(_padding[0], _padding[1], _padding[2], _padding[3]),
      splashColor: Colors.indigo[700],
      shape: StadiumBorder(),
      icon: Icon(
        _iconType,
        textDirection: TextDirection.ltr,
        size: 40,
      ),       
      color: Colors.blue,
      label: Text(
        _text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  static void messageSent(BuildContext context){
    var alertDialog = AlertDialog(
      backgroundColor: Colors.white,      
      title: Text("Resposta enviada!"),
      actions: [
        FlatButton(
          child: Text('Ok', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
          color: Colors.blueAccent,
          shape: StadiumBorder(),
          onPressed: () {
            Navigator.of(context).pop();
            NavigationProfile(context);
          },
        ),        
      ],
      elevation: 24.0,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      }
    );
  }
}