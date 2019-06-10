import 'package:flutter/material.dart';
import 'package:cinema_app/model/movie.dart';
import 'package:cinema_app/net/httphandler.dart';
import 'package:cinema_app/card/card_movie.dart';
import 'package:cinema_app/screen/buy_tickets.dart';
import 'package:cinema_app/screen/functions.dart';

class Tickets extends StatefulWidget {
  @override
  _TicketsState createState() => _TicketsState();

}

class _TicketsState extends State<Tickets> {

  List<Movie> listMovie = List();

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Holi'),),
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
                    MaterialPageRoute(builder: (context) => Functions(movie: listMovie[index]))
                );
              },
            );
          },
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