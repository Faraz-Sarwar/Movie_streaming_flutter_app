import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/repository/movies_repo.dart';

class MoviesViewModel extends ChangeNotifier {
  final MoviesRepo repo = MoviesRepo();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? error;
  List<Data> movies = [];
  Set<String?> genres = {};

  Future<void> getMovies() async {
    _isLoading = true;
    error = null;
    notifyListeners();

    try {
      movies = await repo.fetchData();
    } catch (e) {
      error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Set<String?>> getGenres() async {
    _isLoading = true;
    error = null;
    notifyListeners();
    try {
      genres = await repo.getGenre();
      return genres;
    } catch (e) {
      error = e.toString();
      throw Exception(error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<List<Data>> filterMoviesByGenre(String genre) async {
    _isLoading = true;
    notifyListeners();
    final filteredMovies = movies.where((movie) {
      if (movie.genre == null) return false;
      final genresList = movie.genre!.split(',').map((g) => g.trim()).toList();
      return genresList.contains(genre);
    }).toList();

    _isLoading = false;
    notifyListeners();
    return filteredMovies;
  }
}
