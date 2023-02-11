import 'package:flutter/material.dart';
import 'package:niflex/features/cart/screens/cart_screen.dart';
import 'package:niflex/features/cart/screens/choose_method_screen.dart';
import 'package:niflex/features/home/screens/new_release_screen.dart';
import 'package:niflex/features/home/screens/notification_screen.dart';
import 'package:niflex/features/home/screens/top10_screen.dart';
import 'package:niflex/features/movie_detail/screens/actor_movies.dart';
import 'package:niflex/features/movie_detail/screens/comments_screen.dart';
import 'package:niflex/features/movie_detail/screens/movie_detail_screen.dart';
import 'package:niflex/features/profile/screens/profile_selection_screen.dart';
import 'package:niflex/features/profile/screens/subcribe_screen.dart';
import 'package:niflex/main_app.dart';
import 'package:niflex/models/movie.dart';

final Map<String, WidgetBuilder> routes = {
  MainApp.routeName: (context) => const MainApp(),
  NotificationScreen.routeName: (context) => const NotificationScreen(),
  CommentsScreen.routeName: (context) => const CommentsScreen(),
  ProfileSelectionScreen.routeName: (context) => const ProfileSelectionScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  ChooseMethodScreen.routeName: (context) => ChooseMethodScreen(),
  SubcribeScreen.routeName: (context) => const SubcribeScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Top10Screen.routeName:
      final List<Movie> movies = settings.arguments as List<Movie>;
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => Top10Screen(movies: movies),
      );
    case NewReleasesScreen.routeName:
      final List<Movie> movies = settings.arguments as List<Movie>;
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => NewReleasesScreen(movies: movies),
      );
    case MovieDetailScreen.routeName:
      final Movie movie = settings.arguments as Movie;
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => MovieDetailScreen(movie: movie),
      );
    case ActorMoviesScreen.routeName:
      final String name = settings.arguments as String;
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => ActorMoviesScreen(name: name),
      );
    default:
      return null;
  }
}
