import 'package:movies_app/data/network/network_api_services.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/resources/urls.dart';

class MoviesRepo {
  final NetworkApiServices apiService = NetworkApiServices();

  Future<List<Data>> fetchData() async {
    final response = await apiService.fetchMovies(AppUrls.fetchMovies);
    final movieData = MovieModel.fromJson(response);

    return movieData.data ?? [];
  }

  Future<Set<String>> getGenre() async {
    final movies = await fetchData();
    final genreSet = <String>{};

    // Iterate through each MovieModel
    for (var movie in movies) {
      if (movie.genre != null && movie.genre!.isNotEmpty) {
        // Split the comma-separated genres and add each individually
        final genresList = movie.genre!.split(',').map((g) => g.trim());
        genreSet.addAll(genresList);
      }
    }
    return genreSet;
  }

  Future<List<Data>> getMoviesByGenre(String genre) async {
    final movies = await fetchData();
    final filteredMovies = movies.where((movie) {
      if (movie.genre == null) return false;
      final genresList = movie.genre!.split(',').map((g) => g.trim());
      return genresList.contains(genre);
    }).toList();

    return filteredMovies;
  }
}
