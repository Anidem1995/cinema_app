import 'package:http/http.dart' as http;
import 'package:cinema_app/model/movie.dart';
import 'package:cinema_app/model/movie_function.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class HttpHandler {
  String server_url = '192.168.1.74';

  Future<bool> atemptLogin(username, password) async {
    http.Response response = await http.get('http://$server_url:8080/usuario/login/$username/$password');
    Map<String, dynamic> map = response.headers;
    print(username);
    print(password);
    print('Bearer ${response.headers}');
    print('${response.statusCode}');
    return response.statusCode == 200 ? true : false;
  }

  Future<List<Movie>> MovieListByGenre(genre) async {
    final response = await http.get('http://$server_url:8080/api/pelicula/list/genre/$genre');

    if(response.statusCode == 200) {
      List movies = json.decode(response.body);
      return movies.map((movie) => Movie.fromJson(movie)).toList();
    } else throw Exception('Todo mal');
  }

  Future<List<Movie>> RandomMovieList() async {
    final response = await http.get('http://$server_url:8080/api/pelicula/random');

    if(response.statusCode == 200) {
      List movies = json.decode(response.body);
      return movies.map((movie) => Movie.fromJson(movie)).toList();
    }
    else throw Exception('Todo mal');
  }

  Future<List<Movie>> MovieList() async {
    final response = await http.get('http://$server_url:8080/api/pelicula/lista');

    if(response.statusCode == 200) {
      List movies = json.decode(response.body);
      return movies.map((movie) => Movie.fromJson(movie)).toList();
    }
    else throw Exception('Todo mal');
  }

  Future<List<MovieFunction>> FunctionsList(id_pelicula) async {
    final response = await http.get('http://$server_url:8080/api/funcion/get/$id_pelicula');

    if(response.statusCode == 200) {
      List functions = json.decode(response.body);
      return functions.map((function) => MovieFunction.fromJson(function)).toList();
    }
    else throw Exception('Todo mal');
  }

  Future<bool> saveTicket(id_funcion, asiento) async {
    final response = await http.post('http://$server_url:8080/api/boleto/insertar/$id_funcion/$asiento');
    if(response.statusCode == 204){
      print('Simon que sí');
      return true;
    }
    else {
      print('Chale');
      return false;
    }
  }
}