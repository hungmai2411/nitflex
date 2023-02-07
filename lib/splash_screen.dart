import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:niflex/constants/asset_helpers.dart';
import 'package:niflex/features/profile/screens/profile_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToProfileSelection();
  }

  void navigateToProfileSelection() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, ProfileSelectionScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AssetHelper.netflixSymbol,
          width: 110,
          height: 220,
        ),
      ),
    );
  }
}
