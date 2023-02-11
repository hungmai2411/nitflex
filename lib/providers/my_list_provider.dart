import 'package:flutter/material.dart';
import 'package:niflex/features/movie_detail/screens/movie_detail_screen.dart';
import 'package:niflex/models/movie.dart';

class MyListProvider extends ChangeNotifier {
  List<Movie> _movies = [];

  void setList(List<Movie> movies) {
    _movies = movies;
    notifyListeners();
  }

  List<Movie> get movies => _movies;

  void addMovie(Movie movie) {
    _movies.add(movie);
    notifyListeners();
  }

  void removeMovie(Movie movie) {
    _movies.removeWhere((element) => element.name == movie.name);
    notifyListeners();
  }
}
