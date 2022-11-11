import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:niflex/constants/color_constants.dart';

class Stars extends StatelessWidget {
  final double rating;

  const Stars({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      itemCount: 5,
      rating: rating,
      unratedColor: ColorPalette.unratedColor,
      itemSize: 15,
      itemBuilder: (BuildContext context, _) {
        return Icon(
          Icons.star,
          color: ColorPalette.primaryColor,
        );
      },
    );
  }
}
