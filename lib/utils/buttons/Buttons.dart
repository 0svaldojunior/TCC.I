//Flutter imports
import 'package:flutter/material.dart';

//Packages App imports

class Buttons {
  Buttons() {

  }
  static gradientButton(String text, Function onPressed) {
    return RaisedButton(
      onPressed: onPressed,
      textColor: Colors.white,
      shape: StadiumBorder(),
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(
            begin: Alignment(0.0, 6.4),
            colors: <Color>[
              Color(0xFFF7B500),
              Color(0xFFB620E0),
              Color(0xFF32C5FF),
            ],
          ),
        ),
        padding: EdgeInsets.fromLTRB(135, 15, 135, 15),
        child: Text(
          "$text",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    );
  }

  //Button criado para Welcome Page, para regular FontSize + Padding
  static gradientLargeTextButton(String text, Function onPressed, double fontSize) {
    return RaisedButton(
      onPressed: onPressed,
      textColor: Colors.white,
      shape: StadiumBorder(),
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(
            begin: Alignment(0.0, 6.4),
            colors: <Color>[
              Color(0xFFF7B500),
              Color(0xFFB620E0),
              Color(0xFF32C5FF),
            ],
          ),
        ),
        padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
        child: Text(
          "$text",
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    );
  }

  static flatButton(String text, Function onPressed) {
    return FlatButton(
      onPressed: onPressed, 
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent
        ),
      )
    );
  }
}