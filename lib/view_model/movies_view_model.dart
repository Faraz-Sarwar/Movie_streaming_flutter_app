import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/repository/movies_repo.dart';

class MoviesViewModel extends ChangeNotifier {
  final MoviesRepo repo = MoviesRepo();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? error;
  List<MovieModel> movies = [];
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

  Future<void> getGenres() async {
    _isLoading = true;
    error = null;
    notifyListeners();
    try {
      genres = await repo.getGenre();
    } catch (e) {
      error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
