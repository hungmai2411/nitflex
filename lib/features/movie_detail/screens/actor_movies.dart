import 'package:flutter/material.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/data/list_movies.dart';
import 'package:niflex/features/home/widgets/item_movie.dart';
import 'package:niflex/features/home/widgets/item_notification.dart';
import 'package:niflex/features/movie_detail/screens/movie_detail_screen.dart';
import 'package:niflex/models/movie.dart';

class ActorMoviesScreen extends StatelessWidget {
  final String name;
  static const String routeName = '/actor_movies_screen';
  const ActorMoviesScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    void navigateToMovieDetailScreen(Movie movie) {
      Navigator.pushNamed(
        context,
        MovieDetailScreen.routeName,
        arguments: movie,
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_rounded),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: ColorPalette.backgroundScaffoldColor,
            title: Text(
              '$name Movies',
              style: TextStyles.defaultStyle.semibold.whiteTextColor
                  .setTextSize(19),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(
                  right: kTopPadding,
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
            centerTitle: false,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              top: kItemPadding,
            ),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => navigateToMovieDetailScreen(movies[index]),
                    child: ItemMovie(
                      fit: StackFit.expand,
                      movie: movies[index],
                    ),
                  );
                },
                childCount: movies.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
