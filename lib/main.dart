//FLutter imports
import 'package:flutter/material.dart';

//Packages App imports
import 'package:AgesMental/screens/LoginPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: LoginPage(),
    );
  }
}