class Movie {
  int movie_id;
  String name;
  String genre;
  String rating;
  int duration;
  String image;

  Movie({this.movie_id, this.name, this.genre, this.rating, this.duration, this.image});

  factory Movie.fromJson(Map jsonMap) {
    return Movie(
      movie_id: jsonMap['id_pelicula'],
      name: jsonMap['nom_pelicula'],
      genre: jsonMap['nom_genero'],
      rating: jsonMap['clasificacion'],
      duration: jsonMap['duracion'],
      image: jsonMap['imagen']
    );
  }
}

class MoviesList {
  List<Movie> movies;

  MoviesList({this.movies});

  factory MoviesList.fromJson(List<dynamic> jsonList) {
    List<Movie> movies = List<Movie>();
    movies = jsonList.map((i) => Movie.fromJson(i)).toList();
    return MoviesList(movies: movies);
  }
}