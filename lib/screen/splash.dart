import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cinema_app/utils/navigator.dart';

Future<bool> getSession() async {
  bool active_login;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.getBool('session') == null || preferences.getBool('session') == false ? active_login = false : active_login = true;
  return active_login;
}

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key : key);

  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool session;
  @override
  void initState() {
    super.initState();
    getSession().then(updateSession);
    Timer(Duration(seconds: 3), () => session ?  MyNavigator.goToHome(context) : MyNavigator.goToLogin(context));
  }

  void updateSession(bool session) {
    setState(() {
      this.session = session;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.redAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: Icon(
                          Icons.star,
                          color: Colors.greenAccent,
                          size: 70,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text(
                          "Cine volador mágico del poder",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("El cine más mágico\n volador del poder",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}