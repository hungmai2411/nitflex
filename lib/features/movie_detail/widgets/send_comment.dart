import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';

class SendComment extends StatelessWidget {
  final TextEditingController commentController;

  const SendComment({
    super.key,
    required this.commentController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: commentController,
      enabled: true,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: 'Add Comment',
        hintStyle: TextStyles.defaultStyle.setColor(
          ColorPalette.unratedColor,
        ),
        suffixIcon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            FontAwesomeIcons.faceSmile,
            color: ColorPalette.unratedColor,
            size: 15,
          ),
        ),
        filled: true,
        fillColor: const Color(0xFF1E222A),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(
              kItemPadding,
            ),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorPalette.primaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(
              kItemPadding,
            ),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: kItemPadding,
          vertical: kMediumPadding,
        ),
      ),
      style: TextStyles.defaultStyle.setColor(
        ColorPalette.unratedColor,
      ),
    );
  }
}
