import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/data/list_movies.dart';
import 'package:niflex/features/home/widgets/item_notification.dart';

class TrailerTab extends StatelessWidget {
  const TrailerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return ItemNotification(
            movie: movies[index],
            margin: const EdgeInsets.only(bottom: kDefaultPadding),
          );
        },
        childCount: movies.length,
      ),
    );
  }
}
