import 'package:movies_app/model/movie_model.dart';

class DetailsScreenFiltering {
  String getOneGenre(Data movie) {
    if (movie.genre!.isEmpty) {
      return 'No genre';
    }
    final genres = movie.genre!.split(',').map((m) => m.trim()).toList();
    return genres[0];
  }

  String getYear(Data movie) {
    List<String> year = [];
    if (movie.released!.isEmpty) {
      return "Unknown";
    }
    if (movie.released!.contains('-')) {
      year = movie.released!.split('-').map((m) => m.trim()).toList();
    } else {
      year = movie.released!.split(' ').map((m) => m.trim()).toList();
    }
    return year[year.length - 1];
  }
}
