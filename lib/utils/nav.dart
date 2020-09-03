// Flutter imports
import 'package:flutter/material.dart';

// App package imports

Future push(BuildContext context, Widget page) {
  return Navigator.push(context, MaterialPageRoute(builder:(BuildContext){return page;}));
}