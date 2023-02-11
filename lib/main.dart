import 'package:flutter/material.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/size_config.dart';
import 'package:niflex/providers/cart_provider.dart';
import 'package:niflex/providers/my_list_provider.dart';
import 'package:niflex/providers/notification_provider.dart';
import 'package:niflex/routes.dart';
import 'package:niflex/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MyListProvider>(
          create: (_) => MyListProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider<NotificationProvider>(
          create: (_) => NotificationProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
