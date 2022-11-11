import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/constants/image_helpers.dart';
import 'package:niflex/models/movie.dart';

class ItemNotification extends StatelessWidget {
  final Movie movie;
  final EdgeInsetsGeometry? margin;

  const ItemNotification({
    super.key,
    required this.movie,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          kItemPadding,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    kTopPadding,
                  ),
                  child: ImageHelper.loadFromAsset(
                    movie.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        FontAwesomeIcons.play,
                        size: kDefaultPadding,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: kDefaultPadding),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.defaultStyle.semibold.whiteTextColor
                      .setTextSize(17),
                ),
                const SizedBox(height: kDefaultPadding),
                Text(
                  movie.numOfEpisode,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.defaultStyle.regular.whiteTextColor
                      .setTextSize(15),
                ),
                const SizedBox(height: kDefaultPadding),
                Container(
                  decoration: BoxDecoration(
                    color: ColorPalette.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(kMinPadding),
                  ),
                  padding: const EdgeInsets.all(kTopPadding),
                  child: Text(
                    movie.status,
                    style: TextStyles.defaultStyle.setColor(
                      ColorPalette.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: kDefaultPadding),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                movie.dateTime,
                style: TextStyles.defaultStyle.medium.setTextSize(13).setColor(
                      ColorPalette.textColor.withOpacity(0.5),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
