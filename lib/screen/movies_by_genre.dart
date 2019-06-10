import 'package:flutter/material.dart';
import 'package:cinema_app/model/movie.dart';
import 'package:cinema_app/net/httphandler.dart';
import 'package:cinema_app/card/card_movie.dart';

class MoviesByGenre extends StatefulWidget {
  @override
  _MoviesByGenreState createState() => _MoviesByGenreState();

}

class _MoviesByGenreState extends State<MoviesByGenre> {

  List<Movie> listGeneron = List();
  List<Movie> listAventuras = List();
  List<Movie> listAccion = List();
  List<Movie> listSciFi = List();

  @override
  void initState() {
    super.initState();
    getMoviesGeneron();
    getMoviesAventuras();
    getMoviesAccion();
    getMoviesSciFi();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:  20.0, top: 10.0),
            child: Text(
              'Generon',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ),
          ),
          SizedBox(height: 7,),
          Container(
            height: 225,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listGeneron.length,
              itemBuilder: (BuildContext context, int index) {
                return CardMovie(listGeneron[index]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Aventuras',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
          ),
          SizedBox(height: 7,),
          Container(
            height: 225,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listAventuras.length,
              itemBuilder: (BuildContext context, int index) {
                return CardMovie(listAventuras[index]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Acción',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
          ),
          SizedBox(height: 7,),
          Container(
            height: 225,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listAccion.length,
              itemBuilder: (BuildContext context, int index) {
                return CardMovie(listAccion[index]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Ciencia Ficción',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
          ),
          SizedBox(height: 7,),
          Container(
            height: 225,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listSciFi.length,
              itemBuilder: (BuildContext context, int index) {
                return CardMovie(listSciFi[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  void getMoviesGeneron() async {
    var movies = await HttpHandler().MovieListByGenre('Generon');
    setState(() {
      listGeneron.addAll(movies);
    });
  }

  void getMoviesAventuras() async {
    var movies = await HttpHandler().MovieListByGenre('aventuras');
    setState(() {
      listAventuras.addAll(movies);
    });
  }

  void getMoviesAccion() async {
    var movies = await HttpHandler().MovieListByGenre('accion');
    setState(() {
      listAccion.addAll(movies);
    });
  }

  void getMoviesSciFi() async {
    var movies = await HttpHandler().MovieListByGenre('sci-fi');
    setState(() {
      listSciFi.addAll(movies);
    });
  }

}