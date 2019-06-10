import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cinema_app/net/httphandler.dart';
import 'package:cinema_app/screen/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _showMessage(String text) {
      final snackBar = SnackBar(
        content: Text(text),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blueGrey,
      );
      _globalKey.currentState.showSnackBar(snackBar);
    }

    _login() async {
      print('clic');
      bool status = await HttpHandler().atemptLogin(userController.text, passwordController.text);

      if(status) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool('session',  true);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (consext) => Home()),
            (Route<dynamic> route) => false
        );
      } else _showMessage('Nombre de usuario o contraseña incorrectos');
    }

    final username = TextFormField(
      controller: userController,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Usuario',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32)
          )
      ),
    );

    final password = TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.text,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Contraseña',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32)
          )
      ),
    );

    final login_button = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () => _login(),
          color: Colors.lightBlueAccent,
          child: Text(
            'Iniciar sesión',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            username,
            SizedBox(height: 48.0,),
            password,
            SizedBox(height: 48.0,),
            login_button
          ],
        ),
      ),
    );
  }
}