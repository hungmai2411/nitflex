import 'package:flutter/material.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/widgets/custom_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BoxDownload extends StatelessWidget {
  const BoxDownload({super.key});

  @override
  Widget build(BuildContext context) {
    Color textColorButtonHide = Colors.white;

    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      ColorPalette.textColor = Colors.white;
      print('dark');
    } else {
      textColorButtonHide = ColorPalette.primaryColor;
      ColorPalette.textColor = const Color(0xFF212121);
      ColorPalette.backgroundScaffoldColor = Colors.white;
      ColorPalette.boxSearchColor = const Color(0xFFF5F5F4);
      ColorPalette.buttonHide = ColorPalette.primaryColor.withOpacity(0.2);
      print('white');
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Download',
          style: TextStyles.defaultStyle.bold.setTextSize(18).setColor(
                ColorPalette.primaryColor,
              ),
        ),
        const SizedBox(height: kItemPadding),
        Text(
          'Movies still downloading...',
          style: TextStyles.defaultStyle.regular.whiteTextColor,
        ),
        const SizedBox(height: kMinPadding),
        Text(
          'Please wait or hide process',
          style: TextStyles.defaultStyle.regular.whiteTextColor,
        ),
        const SizedBox(height: kMediumPadding),
        Divider(color: ColorPalette.textColor.withOpacity(0.3)),
        const SizedBox(height: kMediumPadding),
        Row(
          children: [
            Text(
              '457.2 / 968.5 MB',
              style: TextStyles.defaultStyle.semibold.whiteTextColor,
            ),
            const Spacer(),
            Text(
              '47%',
              style: TextStyles.defaultStyle.semibold
                  .setColor(ColorPalette.primaryColor),
            ),
          ],
        ),
        const SizedBox(height: kMinPadding),
        Row(
          children: [
            Expanded(
              child: LinearPercentIndicator(
                padding: EdgeInsets.zero,
                animation: true,
                lineHeight: 6.0,
                barRadius: const Radius.circular(kTopPadding),
                percent: 0.45,
                backgroundColor: ColorPalette.unratedColor,
                progressColor: ColorPalette.primaryColor,
              ),
            ),
            const SizedBox(width: kTopPadding),
            const Icon(
              Icons.close,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
        const SizedBox(height: kItemPadding),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: CustomButton(
            color: ColorPalette.buttonHide,
            icon: null,
            width: null,
            padding: kDefaultPadding,
            textButton: 'Hide',
            textColor: textColorButtonHide,
          ),
        ),
      ],
    );
  }
}
