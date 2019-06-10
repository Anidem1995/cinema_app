import 'package:flutter/material.dart';
import 'package:cinema_app/screen/splash.dart';
import 'package:cinema_app/screen/home.dart';
import 'package:cinema_app/screen/login.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => Home(),
  "/login": (BuildContext context) => Login(),
};


void main() => runApp(Cinema());

class Cinema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      routes: routes,
      theme: ThemeData(
        fontFamily: 'RobotoRegular'
      ),
    );
  }

}