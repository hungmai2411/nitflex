import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/data/lis_icons.dart';

class BoxShare extends StatelessWidget {
  const BoxShare({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      ColorPalette.textColor = Colors.white;
      print('dark');
    } else {
      ColorPalette.textColor = const Color(0xFF212121);
      ColorPalette.backgroundScaffoldColor = Colors.white;
      ColorPalette.boxSearchColor = const Color(0xFFF5F5F4);
      print('white');
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kBottomBarIconSize,
      ),
      child: Column(
        children: [
          const SizedBox(height: kItemPadding),
          Text(
            'Send to',
            style:
                TextStyles.defaultStyle.semibold.whiteTextColor.setTextSize(20),
          ),
          const SizedBox(height: kMinPadding),
          Divider(
            color: ColorPalette.textColor.withOpacity(0.3),
          ),
          const SizedBox(height: kMinPadding),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(top: kDefaultPadding),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset(icons[index].image),
                      const SizedBox(height: kTopPadding),
                      Text(
                        icons[index].name,
                        style: TextStyles.defaultStyle.medium.whiteTextColor
                            .setTextSize(15),
                      ),
                    ],
                  ),
                );
              },
              itemCount: icons.length,
            ),
          ),
        ],
      ),
    );
  }
}
