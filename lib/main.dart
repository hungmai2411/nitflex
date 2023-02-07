import 'package:flutter/material.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/size_config.dart';
import 'package:niflex/features/profile/screens/profile_selection_screen.dart';
import 'package:niflex/main_app.dart';
import 'package:niflex/routes.dart';
import 'package:niflex/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Niflex',
      // theme: ThemeData(
      //   scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
      // ),
      themeMode: ThemeMode.system,
      darkTheme: ColorPalette.darkTheme,
      theme: ColorPalette.lightTheme,
      routes: routes,
      onGenerateRoute: generateRoutes,
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          SizeConfig.init(context);
          return const SplashScreen();
        },
      ),
    );
  }
}
