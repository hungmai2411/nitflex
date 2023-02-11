import 'package:flutter/material.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/main_app.dart';
import 'package:niflex/widgets/custom_button.dart';

class BuySuccessDialog extends StatelessWidget {
  const BuySuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Received a voucher\nLet\'s choose favorite movie',
          textAlign: TextAlign.center,
          style: TextStyles.defaultStyle
              .copyWith(
                color: ColorPalette.textColor,
              )
              .regular
              .setTextSize(17),
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MainApp.routeName);
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Get Started',
              textAlign: TextAlign.center,
              style: TextStyles.defaultStyle.whiteTextColor.setTextSize(18),
            ),
          ),
        ),
      ],
    );
  }
}

class AppDialog extends StatelessWidget {
  final Widget child;

  const AppDialog({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorPalette.boxColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}
