import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:niflex/constants/app_styles.dart';

class NoResult extends StatelessWidget {
  const NoResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sorry, the keyword you entered could not be found. Try to check again or search with other keywords',
        textAlign: TextAlign.center,
        style: TextStyles.defaultStyle.medium.whiteTextColor.setTextSize(16),
      ),
    );
  }
}
