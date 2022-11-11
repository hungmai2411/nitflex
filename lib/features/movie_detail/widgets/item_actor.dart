import 'package:flutter/material.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/models/actor.dart';

class ItemActor extends StatelessWidget {
  Actor actor;

  ItemActor({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(actor.image),
        ),
        const SizedBox(width: kTopPadding),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: Text(
                actor.name,
                maxLines: 2,
                style: TextStyles.defaultStyle.medium.whiteTextColor
                    .setTextSize(15),
              ),
            ),
            const SizedBox(height: kMinPadding),
            Text(
              actor.role,
              style: TextStyles.defaultStyle.medium.setColor(
                ColorPalette.textColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
