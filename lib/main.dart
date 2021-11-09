import 'package:flutter/material.dart';
import 'package:plasma_donor/mainpage.dart';
import 'package:plasma_donor/signuppage.dart';
import 'loginpage.dart';
import 'screens/homepage.dart';
import 'mainpage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red,cardColor: Colors.white),
      home: MainPage(),
    );
  }
}
