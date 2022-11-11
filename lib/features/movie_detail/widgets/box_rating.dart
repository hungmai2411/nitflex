import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/data/lis_icons.dart';
import 'package:niflex/features/movie_detail/widgets/item_rating.dart';
import 'package:niflex/features/movie_detail/widgets/stars.dart';
import 'package:niflex/widgets/custom_button.dart';

class BoxRating extends StatelessWidget {
  const BoxRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kBottomBarIconSize,
      ),
      child: Column(
        children: [
          const SizedBox(height: kItemPadding),
          Text(
            'Give Rating',
            style:
                TextStyles.defaultStyle.semibold.whiteTextColor.setTextSize(22),
          ),
          const SizedBox(height: kMinPadding),
          Divider(
            color: ColorPalette.textColor.withOpacity(0.4),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '5.0',
                        style: TextStyles.defaultStyle.bold
                            .setTextSize(
                              36,
                            )
                            .whiteTextColor,
                        children: <TextSpan>[
                          TextSpan(
                            text: ' / 10',
                            style: TextStyles.defaultStyle.medium
                                .setTextSize(18)
                                .whiteTextColor,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: kMinPadding),
                    const Stars(
                      rating: 5,
                    ),
                    const SizedBox(height: kMinPadding),
                    Text(
                      '(200 Reviews)',
                      style: TextStyles.defaultStyle.regular
                          .setTextSize(14)
                          .whiteTextColor,
                    ),
                  ],
                ),
                const Spacer(),
                VerticalDivider(
                  color: ColorPalette.textColor.withOpacity(0.4),
                  thickness: 1,
                ),
                const Spacer(),
                Expanded(
                  flex: 10,
                  child: Column(
                    children: const [
                      ItemRating(rating: 5),
                      SizedBox(height: kMinPadding),
                      ItemRating(rating: 4),
                      SizedBox(height: kMinPadding),
                      ItemRating(rating: 3),
                      SizedBox(height: kMinPadding),
                      ItemRating(rating: 2),
                      SizedBox(height: kMinPadding),
                      ItemRating(rating: 1),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(height: kMinPadding),
          Divider(
            color: ColorPalette.textColor.withOpacity(0.4),
          ),
          RatingBar(
            initialRating: 3,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            ratingWidget: RatingWidget(
              full: Icon(
                Icons.star_rounded,
                color: ColorPalette.primaryColor,
              ),
              half: Icon(
                Icons.star_half_rounded,
                color: ColorPalette.primaryColor,
              ),
              empty: Icon(
                Icons.star_border_rounded,
                color: ColorPalette.textColor.withOpacity(0.3),
              ),
            ),
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          const SizedBox(height: kItemPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: const CustomButton(
                    color: Color(0xFF34373F),
                    icon: null,
                    width: null,
                    padding: kDefaultPadding,
                    textButton: 'Cancel',
                  ),
                ),
              ),
              const SizedBox(width: kDefaultPadding),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: CustomButton(
                    width: null,
                    padding: kDefaultPadding,
                    color: ColorPalette.primaryColor,
                    icon: null,
                    textButton: 'Submit',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
