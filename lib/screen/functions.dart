import 'package:flutter/material.dart';
import 'package:cinema_app/model/movie.dart';
import 'package:cinema_app/net/httphandler.dart';
import 'package:cinema_app/model/movie_function.dart';
import 'package:cinema_app/screen/buy_tickets.dart';

class Functions extends StatefulWidget {

  Movie movie;

  Functions({Key key, @required this.movie}) : super(key: key);

  @override
  _FunctionsState createState() => _FunctionsState();

}

class _FunctionsState extends State<Functions> {

  List<MovieFunction> listFunctions = List();

  @override
  void initState() {
    super.initState();
    getFunctions();
    print(listFunctions.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Compra de boletos'),),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                child: FadeInImage.assetNetwork(
                  placeholder: "images/moviefilm.png",
                  image: "https://image.tmdb.org/t/p/w500" + widget.movie.image,
                  fit: BoxFit.fill,
                  height: 190,
                  width: double.infinity,
                  fadeInDuration: Duration(milliseconds: 40),
                )
            ),
            GridView.builder(
                itemCount: listFunctions.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Card(
                      child: Container(
                        height: 5,
                        width: 20,
                        child: Text(listFunctions[index].horario),
                      )
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BuyTickets(movie: widget.movie, movieFunction: listFunctions[index]))
                      );
                    },
                  );
                })
          ],
        ),
      ),
    );
  }

  void getFunctions() async {
    var functions = await HttpHandler().FunctionsList(widget.movie.movie_id);
    setState(() {
      listFunctions.addAll(functions);
    });
  }
}