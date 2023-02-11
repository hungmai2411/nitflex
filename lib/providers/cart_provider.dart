import 'package:flutter/material.dart';
import 'package:niflex/models/movie.dart';

class CartProvider extends ChangeNotifier {
  List<Movie> movies = [];

  void addToCart(Movie movie) {
    movies.add(movie);
    notifyListeners();
  }

  void removeFromCart(Movie movie) {
    movies.removeWhere((element) => element.name == movie.name);
    notifyListeners();
  }

  void removeAll() {
    movies = [];
    notifyListeners();
  }
}
