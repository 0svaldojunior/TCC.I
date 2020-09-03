// Flutter imports
import 'package:flutter/material.dart';

// App packages imports

class SimpleText {
  static text(String text, double size, Color colors, {FontWeight weight: FontWeight.normal}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: colors,
        fontWeight: weight
      ),
    );
  }

  static registerText(String text, double size, Color colors, {FontWeight weight: FontWeight.normal}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        color: colors,
        fontWeight: weight
      ),
    );
  }
  
}