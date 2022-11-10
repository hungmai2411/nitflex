import 'package:flutter/material.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';

class ItemSort extends StatelessWidget {
  final String prop;
  final String groupValue;

  const ItemSort({
    super.key,
    required this.prop,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: kItemPadding),
      padding: const EdgeInsets.all(kItemPadding),
      decoration: BoxDecoration(
        color: groupValue == prop ? ColorPalette.primaryColor : null,
        borderRadius: BorderRadius.circular(
          kMediumPadding,
        ),
        border: Border.all(color: ColorPalette.primaryColor),
      ),
      child: Text(
        prop,
        style: TextStyles.defaultStyle.medium.setTextSize(16).setColor(
              groupValue != prop ? ColorPalette.primaryColor : Colors.white,
            ),
      ),
    );
  }
}
