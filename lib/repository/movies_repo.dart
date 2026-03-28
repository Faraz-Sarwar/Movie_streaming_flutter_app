import 'package:http/http.dart';
import 'package:movies_app/data/network/network_api_services.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/resources/urls.dart';

class MoviesRepo {
  final NetworkApiServices apiService = NetworkApiServices();
  Future<List<MovieModel>> fetchData() async {
    final response = await apiService.fetchMovies(AppUrls.fetchMovies);
    return (response as List).map((e) => MovieModel.fromJson(e)).toList();
  }

  Future<Set<String?>> getGenre() async {
    final movies = await fetchData();
    final genreSet = <String?>{};

    // Iterate through each MovieModel
    for (var movie in movies) {
      if (movie.data != null) {
        //iterate through each data list item in movieModel
        for (var data in movie.data!) {
          genreSet.add(data.genre);
        }
      }
    }

    return genreSet;
  }
}
