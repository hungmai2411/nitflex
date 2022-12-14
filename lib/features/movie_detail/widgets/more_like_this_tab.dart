import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/data/list_movies.dart';
import 'package:niflex/features/home/widgets/item_movie.dart';

class MoreLikeThisTab extends StatelessWidget {
  const MoreLikeThisTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: kDefaultPadding,
        crossAxisSpacing: kDefaultPadding,
        childAspectRatio: 1,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: ItemMovie(
              fit: StackFit.expand,
              movie: movies[index],
            ),
          );
        },
        childCount: movies.length,
      ),
    );
  }
}
