import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/dimensions_constants.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Widget? icon;
  final String textButton;
  final Color? borderColor;
  final double? width;
  final double? padding;
  final Color? textColor;

  const CustomButton(
      {super.key,
      required this.color,
      required this.icon,
      required this.textButton,
      this.borderColor,
      this.width = 125,
      this.padding = kItemPadding,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: padding!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: color,
        border: borderColor != null
            ? Border.all(color: borderColor!, width: 2)
            : null,
      ),
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // icon
                icon ?? Container(),
                const SizedBox(width: kItemPadding),
                Text(
                  textButton,
                  style: TextStyles.defaultStyle.medium.setColor(textColor!),
                ),
              ],
            )
          : Center(
              child: Text(
                textButton,
                style: TextStyles.defaultStyle.medium
                    .setColor(textColor!)
                    .setTextSize(16),
              ),
            ),
    );
  }
}
