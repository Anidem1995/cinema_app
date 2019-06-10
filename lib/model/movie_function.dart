class MovieFunction {
  int id_funcion;
  int id_pelicula;
  String horario;
  String sala;

  MovieFunction({this.id_funcion, this.id_pelicula, this.horario, this.sala});

  factory MovieFunction.fromJson(Map jsonMap) {
    return MovieFunction(
      id_funcion: jsonMap['id_funcion'],
      id_pelicula: jsonMap['id_pelicula'],
      horario: jsonMap['horario'],
      sala: jsonMap['sala']
    );
  }
}

class MovieFunctionsList {
  List<MovieFunction> functions;

  MovieFunctionsList({this.functions});

  factory MovieFunctionsList.fromJson(List<dynamic> jsonList) {
    List<MovieFunction> functions = List<MovieFunction>();

    functions = jsonList.map((i) => MovieFunction.fromJson(i)).toList();
    return MovieFunctionsList(functions: functions);
  }
}