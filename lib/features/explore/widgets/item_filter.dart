import 'package:flutter/material.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';

class ItemFilter extends StatelessWidget {
  final String prop;

  const ItemFilter({
    super.key,
    required this.prop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: kItemPadding),
      padding: const EdgeInsets.all(kItemPadding),
      decoration: BoxDecoration(
        color: ColorPalette.primaryColor,
        borderRadius: BorderRadius.circular(
          kMediumPadding,
        ),
        border: Border.all(color: ColorPalette.primaryColor),
      ),
      child: Center(
        child: Text(
          prop,
          style: TextStyles.defaultStyle.medium.setTextSize(16).whiteTextColor,
        ),
      ),
    );
  }
}
