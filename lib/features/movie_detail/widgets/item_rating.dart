import 'package:flutter/material.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math';

class ItemRating extends StatelessWidget {
  final double rating;
  const ItemRating({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rating.floor().toString(),
          style: TextStyles.defaultStyle.regular.whiteTextColor,
        ),
        const SizedBox(width: kItemPadding),
        Expanded(
          child: LinearPercentIndicator(
            animation: true,
            lineHeight: 6.0,
            barRadius: const Radius.circular(kTopPadding),
            percent: Random().nextDouble() * 1,
            backgroundColor: ColorPalette.unratedColor,
            progressColor: ColorPalette.primaryColor,
          ),
        ),
      ],
    );
  }
}
