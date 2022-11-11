import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/models/comment.dart';

class ItemComment extends StatelessWidget {
  final Comment comment;

  const ItemComment({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // image
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(comment.image),
            ),
            const SizedBox(width: kItemPadding),
            Text(
              comment.name,
              style: TextStyles.defaultStyle.semibold.whiteTextColor
                  .setTextSize(15),
            ),
            const Spacer(),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: const Center(
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: kItemPadding),
        // comment
        Text(
          comment.comment,
          style: TextStyles.defaultStyle.regular.whiteTextColor.setTextSize(15),
        ),
        const SizedBox(height: kItemPadding),
        // like
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite,
              color: ColorPalette.primaryColor,
            ),
            const SizedBox(width: kTopPadding),
            Text(
              comment.numLikes.floor().toString(),
              style: TextStyles.defaultStyle.regular.whiteTextColor
                  .setTextSize(15),
            ),
            const SizedBox(width: kTopPadding),
            Text(
              '3 days ago',
              style: TextStyles.defaultStyle.regular.whiteTextColor
                  .setTextSize(15),
            ),
          ],
        ),
      ],
    );
  }
}
