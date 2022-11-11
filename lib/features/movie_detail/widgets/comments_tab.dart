import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/asset_helpers.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/data/list_comments.dart';
import 'package:niflex/features/movie_detail/screens/comments_screen.dart';
import 'package:niflex/features/movie_detail/widgets/item_comment.dart';

class CommentsTab extends StatelessWidget {
  const CommentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    navigateToCommentsScreen() {
      Navigator.pushNamed(context, CommentsScreen.routeName);
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(
                  bottom: kDefaultPadding, top: kTopPadding),
              child: Row(
                children: [
                  Text(
                    '24.6K Comments',
                    style: TextStyles.defaultStyle.bold.whiteTextColor
                        .setTextSize(15),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: navigateToCommentsScreen,
                    child: Text(
                      'See all',
                      style: TextStyles.defaultStyle.medium
                          .setColor(ColorPalette.primaryColor)
                          .setTextSize(15),
                    ),
                  )
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: kMediumPadding),
            child: ItemComment(
              comment: comments[index - 1],
            ),
          );
        },
        childCount: comments.length + 1,
      ),
    );
  }
}
