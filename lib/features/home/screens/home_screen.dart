import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/asset_helpers.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/constants/size_config.dart';
import 'package:niflex/data/list_movies.dart';
import 'package:niflex/features/home/screens/notification_screen.dart';
import 'package:niflex/features/home/widgets/item_movie.dart';
import 'package:niflex/features/home/screens/new_release_screen.dart';
import 'package:niflex/features/home/screens/top10_screen.dart';
import 'package:niflex/models/movie.dart';
import 'package:niflex/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    void navigateToTop10() {
      Navigator.pushNamed(
        context,
        Top10Screen.routeName,
        arguments: movies,
      );
    }

    void navigateToNotificationScreen() {
      Navigator.pushNamed(
        context,
        NotificationScreen.routeName,
      );
    }

    void navigateToNewReleases() {
      Navigator.pushNamed(
        context,
        NewReleasesScreen.routeName,
        arguments: movies,
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            automaticallyImplyLeading: false,
            backgroundColor: ColorPalette.backgroundScaffoldColor,
            flexibleSpace: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  AssetHelper.moviePoster,
                  fit: BoxFit.cover,
                ),
                // name film, genre, and buttons
                Positioned(
                  bottom: kItemPadding,
                  left: kItemPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wreck It Ralph 2',
                        style: TextStyles.defaultStyle.whiteTextColor.bold
                            .setTextSize(20),
                      ),
                      Text(
                        'Anime, Happy,..',
                        style: TextStyles.defaultStyle.whiteTextColor.medium
                            .setTextSize(15),
                      ),
                      const SizedBox(height: kItemPadding),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const CustomButton(
                              color: ColorPalette.primaryColor,
                              icon: Icon(
                                FontAwesomeIcons.play,
                                color: Colors.white,
                              ),
                              textButton: 'Play',
                            ),
                          ),
                          const SizedBox(width: kItemPadding),
                          InkWell(
                            onTap: () {},
                            child: const CustomButton(
                              color: Colors.transparent,
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              textButton: 'My List',
                              borderColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: kItemPadding,
                  right: kDefaultPadding,
                  child: SafeArea(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: navigateToNotificationScreen,
                          child: const Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: kDefaultPadding),
                        GestureDetector(
                          onTap: navigateToNotificationScreen,
                          child: const Icon(
                            FontAwesomeIcons.bell,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                //
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top 10 Movies This Week',
                        style: TextStyles.defaultStyle.bold.whiteTextColor
                            .setTextSize(18),
                      ),
                      GestureDetector(
                        onTap: navigateToTop10,
                        child: Text(
                          'See All',
                          style: TextStyles.defaultStyle.regular
                              .setTextSize(16)
                              .setColor(ColorPalette.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      Movie movie = movies[index];
                      return ItemMovie(
                        margin: const EdgeInsets.only(left: kDefaultPadding),
                        movie: movie,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Releases',
                        style: TextStyles.defaultStyle.bold.whiteTextColor
                            .setTextSize(18),
                      ),
                      GestureDetector(
                        onTap: navigateToNewReleases,
                        child: Text(
                          'See All',
                          style: TextStyles.defaultStyle.regular
                              .setTextSize(16)
                              .setColor(ColorPalette.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      Movie movie = movies[index];
                      return ItemMovie(
                        margin: const EdgeInsets.only(left: kDefaultPadding),
                        movie: movie,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
