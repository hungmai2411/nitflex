import 'package:flutter/material.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/size_config.dart';
import 'package:niflex/main_app.dart';
import 'package:niflex/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Niflex',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      routes: routes,
      onGenerateRoute: generateRoutes,
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          SizeConfig.init(context);
          return const MainApp();
        },
      ),
    );
  }
}
