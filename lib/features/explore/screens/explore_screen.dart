import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/constants/size_config.dart';
import 'package:niflex/data/list_movies.dart';
import 'package:niflex/features/explore/widgets/box_search.dart';
import 'package:niflex/features/explore/widgets/filter_dialog.dart';
import 'package:niflex/features/explore/widgets/item_filter.dart';
import 'package:niflex/features/explore/widgets/item_search.dart';
import 'package:niflex/features/explore/widgets/no_result.dart';
import 'package:niflex/features/home/widgets/item_movie.dart';
import 'package:niflex/features/movie_detail/screens/movie_detail_screen.dart';
import 'package:niflex/models/movie.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({
    super.key,
  });

  static const String routeName = '/explore_screen';

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isClicked = false;
  List filterResults = [];
  List<Movie> tmp = movies;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  void navigateToMovieDetailScreen(Movie movie) {
    Navigator.pushNamed(
      context,
      MovieDetailScreen.routeName,
      arguments: movie,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      ColorPalette.textColor = Colors.white;
      ColorPalette.backgroundScaffoldColor = const Color(0xFF171A20);
      ColorPalette.boxSearchColor = const Color(0xFF1E222A);

      print('dark');
    } else {
      ColorPalette.textColor = const Color(0xFF212121);
      ColorPalette.backgroundScaffoldColor = Colors.white;
      ColorPalette.boxSearchColor = const Color(0xFFF5F5F4);
      print('white');
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              title: Row(
                children: [
                  Expanded(
                    child: BoxSearch(
                      searchController: searchController,
                      callback: () => setState(() {
                        isClicked = true;
                      }),
                      onChanged: (value) {
                        setState(() {
                          isClicked = false;
                          tmp = movies
                              .where((element) => element.name.contains(value))
                              .toList();
                        });
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final result = await showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return Container(
                            height: 500,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              color: ColorPalette.backgroundScaffoldColor,
                            ),
                            child: FilterDialog(
                              filterResults: filterResults,
                            ),
                          );
                        },
                      );
                      setState(() {
                        if (result == Null) {
                          filterResults = result;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kTopPadding),
                        color: ColorPalette.primaryColor.withOpacity(0.2),
                      ),
                      padding: const EdgeInsets.all(kItemPadding),
                      margin: const EdgeInsets.only(left: kItemPadding),
                      child: Icon(
                        FontAwesomeIcons.sliders,
                        color: ColorPalette.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              centerTitle: false,
            ),
            if (filterResults.isNotEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: kDefaultPadding,
                    top: kItemPadding,
                  ),
                  child: SizedBox(
                    height: 43,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        if (filterResults[index] != '') {
                          return ItemFilter(
                            prop: filterResults[index],
                          );
                        }
                        return Container();
                      },
                      itemCount: filterResults.length,
                    ),
                  ),
                ),
              ),
            !isClicked
                ? tmp.isEmpty
                    ? SliverPadding(
                        padding: EdgeInsets.only(
                          top: SizeConfig.screenHeight / 3,
                          left: kMediumPadding,
                          right: kMediumPadding,
                        ),
                        sliver: const SliverToBoxAdapter(
                          child: NoResult(),
                        ),
                      )
                    : SliverPadding(
                        padding: const EdgeInsets.only(
                          left: kDefaultPadding,
                          right: kDefaultPadding,
                          top: kItemPadding,
                        ),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: kDefaultPadding,
                            crossAxisSpacing: kDefaultPadding,
                            childAspectRatio: 1,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () =>
                                    navigateToMovieDetailScreen(movies[index]),
                                child: ItemMovie(
                                  fit: StackFit.expand,
                                  movie: tmp[index],
                                ),
                              );
                            },
                            childCount: tmp.length,
                          ),
                        ),
                      )
                : SliverPadding(
                    padding: const EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: kItemPadding),
                              child: Text(
                                'Top Search',
                                style: TextStyles
                                    .defaultStyle.bold.whiteTextColor
                                    .setTextSize(18),
                              ),
                            );
                          } else {
                            Movie movie = movies[index - 1];

                            return ItemSearch(
                              movie: movie,
                              margin: const EdgeInsets.only(
                                bottom: kDefaultPadding,
                              ),
                            );
                          }
                        },
                        childCount: movies.length + 1,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
