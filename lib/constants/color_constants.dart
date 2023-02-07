import 'package:flutter/material.dart';

class ColorPalette {
  static Color primaryColor = const Color(0xffE3111F);
  static Color secondColor = const Color(0xff8F67E8);
  static Color yellowColor = const Color(0xffFE9C5E);
  static Color unratedColor = const Color(0xFFE0DDF5);
  static Color textColor = Colors.white;
  static Color dividerColor = const Color(0xFFE5E7EB);
  static Color subTitleColor = const Color(0xFF838383);
  static Color backgroundScaffoldColor = const Color(0xFF171A20);
  static Color boxSearchColor = const Color(0xFF1E222A);
  static Color buttonHide = const Color(0xFF34373F);

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF171A20),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
  );

  static const profileColors = [
    Colors.amber,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple
  ];

  // Hàm đổi giao diện theo các chủ đề.
  static void changeTheme(int themeCode) {
    switch (themeCode) {
      // Black Theme.
      case 0:
        primaryColor = const Color(0xffE3111F);
        secondColor = const Color(0xff8F67E8);
        yellowColor = const Color(0xffFE9C5E);
        unratedColor = const Color(0xFFE0DDF5);
        dividerColor = const Color(0xFFE5E7EB);
        subTitleColor = const Color(0xFF838383);
        backgroundScaffoldColor = const Color(0xFF171A20);
        textColor = const Color(0xFF212121);

        break;

      // White Theme.
      case 1:
        textColor = Colors.white;
        primaryColor = const Color(0xffE3111F);
        secondColor = const Color(0xff8F67E8);
        yellowColor = const Color(0xffFE9C5E);
        unratedColor = const Color(0xFFE0DDF5);
        dividerColor = const Color(0xFFE5E7EB);
        subTitleColor = const Color(0xFF838383);
        backgroundScaffoldColor = Colors.white;

        break;
    }
  }
}
