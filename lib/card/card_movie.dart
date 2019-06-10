import 'package:flutter/material.dart';
import 'package:cinema_app/model/movie.dart';

class CardMovie extends StatelessWidget {
  Movie movie;
  CardMovie(this.movie);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            height: 144.0,
            width: 500.0,
            color: Colors.grey,
            child: FadeInImage.assetNetwork(
              placeholder: "images/moviefilm.png",
              image: "https://image.tmdb.org/t/p/w500" + movie.image,
              fit: BoxFit.fill,
              height: 190,
              width: double.infinity,
              fadeInDuration: Duration(milliseconds: 40),
            )
          ),
          padding(Text(movie.name, style: TextStyle(fontSize: 18.0),)),
          Row(
            children: <Widget>[
              padding(Icon(Icons.access_time)),
              padding(Text(movie.duration.toString(), style: TextStyle(fontSize: 16.0),)),
              padding(Text(movie.genre, style: TextStyle(fontSize: 16.0),)),
              padding(Text(movie.rating, style: TextStyle(fontSize: 16.0),))
            ],
          )
        ],
      ),
    );
  }

  Widget padding(Widget widget) {
    return Padding(padding: EdgeInsets.all(7.0), child: widget,);
  }
}