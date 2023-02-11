import 'package:flutter/material.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/features/explore/screens/explore_screen.dart';
import 'package:niflex/features/home/screens/home_screen.dart';
import 'package:niflex/features/my_list/screens/my_list_screen.dart';
import 'package:niflex/features/profile/screens/profile_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static String routeName = '/main_app';

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        onTap: (i) => setState(
          () => _currentIndex = i,
        ),
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
        selectedColorOpacity: 0.2,
        currentIndex: _currentIndex,
        margin: const EdgeInsets.symmetric(
          horizontal: kMediumPadding,
          vertical: kDefaultPadding,
        ),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.house,
              size: kDefaultPadding,
            ),
            title: const Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.solidCompass,
              size: kDefaultPadding,
            ),
            title: const Text("Explore"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.solidBookmark,
              size: kDefaultPadding,
            ),
            title: const Text("My List"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.solidUser,
              size: kDefaultPadding,
            ),
            title: const Text("Profile"),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          ExploreScreen(),
          MyListScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
