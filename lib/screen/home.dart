import 'package:flutter/material.dart';
import 'package:cinema_app/model/movie.dart';
import 'package:cinema_app/net/httphandler.dart';
import 'package:cinema_app/card/card_movie.dart';
import 'package:cinema_app/screen/tickets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Movie> listMovie = List();

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cine volador mágico del poder',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(title: Text('Holi'),),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('José'),
                accountEmail: Text('14030732@itcelaya.edu.mx'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://scontent-dfw5-2.xx.fbcdn.net/v/t1.0-9/31450583_1611031418950542_8233738729211035648_n.jpg?_nc_cat=103&_nc_ht=scontent-dfw5-2.xx&oh=2c5385728368e863a87ceb5b64f5ef6d&oe=5D0234D3'),
                ),
              ),
              ListTile(
                title: Text('Boletos'),
                leading: Icon(Icons.call_to_action),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tickets())
                  );
                } ,
              ),
              ListTile(
                title: Text('Lista'),
                leading: Icon(Icons.movie),
              ),
              ListTile(
                title: Text('Cerrar sesión'),
                leading: Icon(Icons.exit_to_app),
              )
            ],
          ),
        ),
        body: Center(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: listMovie.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: CardMovie(listMovie[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tickets())
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void getMovies() async {
    var movies = await HttpHandler().MovieList();
    setState(() {
      listMovie.addAll(movies);
    });
  }
}