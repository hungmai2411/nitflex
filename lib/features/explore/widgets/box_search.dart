import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';

class BoxSearch extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback callback;
  final Function(String) onChanged;

  const BoxSearch({
    super.key,
    required this.searchController,
    required this.callback,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: callback,
      controller: searchController,
      enabled: true,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyles.defaultStyle.setColor(
          ColorPalette.unratedColor,
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            FontAwesomeIcons.magnifyingGlass,
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
        contentPadding: const EdgeInsets.symmetric(horizontal: kItemPadding),
      ),
      style: TextStyles.defaultStyle.setColor(
        ColorPalette.unratedColor,
      ),
      onChanged: (value) {
        onChanged(value);
      },
      onSubmitted: (String submitValue) {},
    );
  }
}
