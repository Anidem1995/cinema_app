import 'package:flutter/material.dart';
import 'package:cinema_app/model/movie.dart';
import 'package:cinema_app/model/movie_function.dart';

class BuyTickets extends StatefulWidget {
  Movie movie;
  MovieFunction movieFunction;


  BuyTickets({Key key, @required this.movie, @required this.movieFunction}) : super(key: key);

  @override
  _BuyTicketsSate createState() => _BuyTicketsSate();

}

class _BuyTicketsSate extends State<BuyTickets> {
  String asiento = "";
  String funcion="";
  String usuario="";
  String token="";
  List<Container> asien = new List();
  var lis = ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "G1", "G2", "G3", "G4", "G5", "G6","G7","G8",];



  TextEditingController counterController = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {

    final grid = new GridView.builder(
      itemCount: lis.length,
      gridDelegate:
      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: new Card(
            elevation: 5.0,
            child: new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('images/butaca-de-cine.png'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
              child: new Text(lis[index], style: TextStyle(color: Colors.white),),
            ),
          ),
          onTap: () {
            asiento = lis[index];
            print(asiento);
            deactivate();
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Compra'),
                  content: Text("Asiento seleccionado: " +
                      asiento +
                      "¿Desea continuar con la compra?"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Aceptar'),
                      onPressed: () {
                        //getData();
                      },
                    ),
                    FlatButton(
                      child: Text('Cancelar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              },
            );
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.name),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 5.0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 170,
                    child: FadeInImage.assetNetwork(
                      placeholder: "images/moviefilm.png",
                      image: "https://image.tmdb.org/t/p/w500" + widget.movie.image,
                      fit: BoxFit.fill,
                      height: 190,
                      width: double.infinity,
                      fadeInDuration: Duration(milliseconds: 40),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Película:' + widget.movie.name, style: TextStyle(fontSize: 18),),
                        Row(
                          children: <Widget>[
                            Text('Hora:' + widget.movieFunction.horario, style: TextStyle(fontSize: 18),),
                            Padding(padding: EdgeInsets.only(left: 15), child: Text('Sala ' + widget.movieFunction.sala, style: TextStyle(fontSize: 18),),)
                          ],
                        ),
                        Text('Boleto de adulto', style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0, bottom: 15.0),
              child: Container(
                alignment: Alignment(0.0, 0.0),
                width: MediaQuery.of(context).size.width,
                height: 25,
                color: Colors.blueGrey,
                child: Text('Pantalla', style: TextStyle(color: Colors.white, fontSize: 16.0),),
              ),
            ),
            Flexible(child: grid)
          ],
        ),
      ),
    );
  }
}