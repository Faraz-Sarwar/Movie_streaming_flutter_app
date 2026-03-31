import 'package:http/http.dart';
import 'package:movies_app/data/network/network_api_services.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/resources/urls.dart';

class MoviesRepo {
  final NetworkApiServices apiService = NetworkApiServices();
  Future<List<Data>> fetchData() async {
    final response = await apiService.fetchMovies(AppUrls.fetchMovies);
    print('API RESPONSE: $response');
    final movieData = MovieModel.fromJson(response);

    return movieData.data ?? [];
  }

  Future<Set<String?>> getGenre() async {
    final movies = await fetchData();
    final genreSet = <String?>{};

    // Iterate through each MovieModel
    for (var movie in movies) {
      if (movie.genre != null && movie.genre!.isNotEmpty) {
        genreSet.add(movie.genre);
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
