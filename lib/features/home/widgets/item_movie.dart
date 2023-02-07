import 'package:flutter/material.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/constants/image_helpers.dart';
import 'package:niflex/models/movie.dart';

class ItemMovie extends StatelessWidget {
  final Movie movie;
  final EdgeInsetsGeometry? margin;
  final StackFit fit;

  const ItemMovie(
      {super.key, required this.movie, this.margin, this.fit = StackFit.loose});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          kTopPadding,
        ),
      ),
      child: Stack(
        fit: fit,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              kTopPadding,
            ),
            child: ImageHelper.loadFromAsset(movie.image,
                fit: BoxFit.cover, width: 110.0, height: 220.0),
          ),
          Positioned(
            left: kTopPadding,
            top: kTopPadding,
            child: Container(
              padding: const EdgeInsets.all(kMinPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kMinPadding),
                color: ColorPalette.primaryColor,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.white,
                    size: kDefaultPadding,
                  ),
                  const SizedBox(width: kMinPadding),
                  Text(
                    movie.rating.toString(),
                    style: TextStyles.defaultStyle.setColor(Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
