import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/asset_helpers.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/data/list_movies.dart';
import 'package:niflex/features/cart/screens/cart_screen.dart';
import 'package:niflex/features/home/screens/notification_screen.dart';
import 'package:niflex/features/home/widgets/item_movie.dart';
import 'package:niflex/features/home/screens/new_release_screen.dart';
import 'package:niflex/features/home/screens/top10_screen.dart';
import 'package:niflex/models/movie.dart';
import 'package:niflex/providers/cart_provider.dart';
import 'package:niflex/providers/notification_provider.dart';
import 'package:niflex/widgets/custom_button.dart';
import 'package:niflex/widgets/shimmer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    displayShimmer();
  }

  void displayShimmer() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      ColorPalette.textColor = Colors.white;
    } else {
      ColorPalette.textColor = const Color(0xFF212121);
    }

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

    void navigateToCartScreen() {
      Navigator.pushNamed(
        context,
        CartScreen.routeName,
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
                        style: TextStyles.defaultStyle.bold
                            .setTextSize(20)
                            .setColor(Colors.white),
                      ),
                      Text(
                        'Anime, Happy,..',
                        style: TextStyles.defaultStyle
                            .setColor(Colors.white)
                            .medium
                            .setTextSize(15),
                      ),
                      const SizedBox(height: kItemPadding),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CustomButton(
                              color: ColorPalette.primaryColor,
                              icon: const Icon(
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
                          onTap: navigateToCartScreen,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),
                              if (context
                                  .watch<CartProvider>()
                                  .movies
                                  .isNotEmpty)
                                Positioned(
                                  child: Container(
                                    width: kTopPadding,
                                    height: kTopPadding,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorPalette.primaryColor,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(width: kDefaultPadding),
                        GestureDetector(
                          onTap: navigateToNotificationScreen,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              const Icon(
                                FontAwesomeIcons.bell,
                                color: Colors.white,
                              ),
                              if (context
                                  .watch<NotificationProvider>()
                                  .vouchers
                                  .isNotEmpty)
                                Positioned(
                                  child: Container(
                                    width: kTopPadding,
                                    height: kTopPadding,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorPalette.primaryColor,
                                    ),
                                  ),
                                ),
                            ],
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
                        'Top Trending',
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
                  height: 220,
                  child: isLoading
                      ? shimmer
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            Movie movie = movies[index];
                            return ItemMovie(
                              margin:
                                  const EdgeInsets.only(left: kDefaultPadding),
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
                        'Continue Watching',
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
                  height: 220,
                  child: isLoading
                      ? shimmer
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            Movie movie = movies[index];
                            return ItemMovie(
                              margin:
                                  const EdgeInsets.only(left: kDefaultPadding),
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
                        'Nitflex Original',
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
                  height: 220,
                  child: isLoading
                      ? shimmer
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            Movie movie = movies[index];
                            return ItemMovie(
                              margin:
                                  const EdgeInsets.only(left: kDefaultPadding),
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
                        'Top Rated Movie',
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
                  height: 220,
                  child: isLoading
                      ? shimmer
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            Movie movie = movies[index];
                            return ItemMovie(
                              margin:
                                  const EdgeInsets.only(left: kDefaultPadding),
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
