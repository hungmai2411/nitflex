import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:niflex/constants/color_constants.dart';

showSnackBar(BuildContext context, String content) {
  final size = MediaQuery.of(context).size;

  Flushbar(
    maxWidth: size.width * .8,
    borderRadius: BorderRadius.circular(10),
    backgroundColor: ColorPalette.boxSearchColor,
    flushbarPosition: FlushbarPosition.TOP,
    messageColor: ColorPalette.textColor,
    messageSize: 16,
    message: content,
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    icon: Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorPalette.primaryColor,
      ),
      child: const Icon(
        Icons.check,
        size: 20.0,
        color: Colors.white,
      ),
    ),
    duration: const Duration(seconds: 3),
  ).show(context);
}
