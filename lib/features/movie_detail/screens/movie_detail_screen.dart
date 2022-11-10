import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/asset_helpers.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/features/movie_detail/screens/actor_movies.dart';
import 'package:niflex/features/movie_detail/widgets/box_download.dart';
import 'package:niflex/features/movie_detail/widgets/box_rating.dart';
import 'package:niflex/features/movie_detail/widgets/box_share.dart';
import 'package:niflex/features/movie_detail/widgets/comments_tab.dart';
import 'package:niflex/features/movie_detail/widgets/item_actor.dart';
import 'package:niflex/features/movie_detail/widgets/more_like_this_tab.dart';
import 'package:niflex/features/movie_detail/widgets/trailer_tab.dart';
import 'package:niflex/models/actor.dart';
import 'package:niflex/models/movie.dart';
import 'package:niflex/widgets/custom_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  static const String routeName = '/movie_detail_screen';

  const MovieDetailScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final List<Actor> actors = [
      Actor(
        image: AssetHelper.imgAvatar,
        name: 'James Cameron',
        role: 'Director',
      ),
      Actor(
        image: AssetHelper.imgAvatar2,
        name: 'James Cameron',
        role: 'Cast',
      ),
      Actor(
        image: AssetHelper.imgAvatar3,
        name: 'James Cameron',
        role: 'Cast',
      ),
      Actor(
        image: AssetHelper.imgAvatar4,
        name: 'James Cameron',
        role: 'Cast',
      ),
    ];

    navigateToActorMoviesScreen(String name) {
      Navigator.pushNamed(context, ActorMoviesScreen.routeName,
          arguments: name);
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              backgroundColor: Colors.transparent,
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: kItemPadding),
                  child: Icon(
                    Icons.cast_rounded,
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  movie.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Row(
                  children: [
                    // name movie
                    Text(
                      movie.name,
                      style: TextStyles.defaultStyle.bold.whiteTextColor
                          .setTextSize(18),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.bookmark_outline_rounded,
                      color: Colors.white,
                    ),
                    const SizedBox(width: kItemPadding),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return Container(
                              height: 300,
                              decoration: const BoxDecoration(
                                color: Color(0xFF1E222A),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(kMediumPadding),
                                  topRight: Radius.circular(kMediumPadding),
                                ),
                              ),
                              child: const BoxShare(),
                            );
                          },
                        );
                      },
                      child: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    movie.rating.toString().length > 1
                        ? const Icon(
                            Icons.star_half,
                            color: ColorPalette.primaryColor,
                          )
                        : const Icon(
                            Icons.star,
                            color: ColorPalette.primaryColor,
                          ),
                    const SizedBox(width: kMinPadding),
                    // star movie
                    Text(
                      movie.rating.toString(),
                      style: TextStyles.defaultStyle.medium
                          .setTextSize(15)
                          .setColor(ColorPalette.primaryColor),
                    ),
                    const SizedBox(width: kMinPadding),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return Container(
                              height: 350,
                              decoration: const BoxDecoration(
                                color: Color(0xFF1E222A),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(kMediumPadding),
                                  topRight: Radius.circular(kMediumPadding),
                                ),
                              ),
                              child: const BoxRating(),
                            );
                          },
                        );
                      },
                      child: const Icon(
                        Icons.chevron_right_rounded,
                        color: ColorPalette.primaryColor,
                      ),
                    ),
                    Text(
                      '2022',
                      style: TextStyles.defaultStyle.medium
                          .setTextSize(15)
                          .whiteTextColor,
                    ),
                    const SizedBox(width: kItemPadding),
                    buildItemBox('13+'),
                    buildItemBox('United States'),
                  ],
                ),
              ),
            ),
            // button play & download
            SliverPadding(
              padding: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                top: kDefaultPadding,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        color: ColorPalette.primaryColor,
                        icon: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              FontAwesomeIcons.play,
                              size: kDefaultPadding,
                            ),
                          ),
                        ),
                        textButton: 'Play',
                      ),
                    ),
                    const SizedBox(width: kItemPadding),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(kItemPadding),
                                  ),
                                ),
                                backgroundColor: Color(0xFF1E222A),
                                content: BoxDownload(),
                              );
                            },
                          );
                        },
                        child: CustomButton(
                          color: ColorPalette.backgroundScaffoldColor,
                          borderColor: ColorPalette.primaryColor,
                          icon: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: ColorPalette.backgroundScaffoldColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                FontAwesomeIcons.download,
                                size: kDefaultPadding,
                                color: ColorPalette.primaryColor,
                              ),
                            ),
                          ),
                          textColor: ColorPalette.primaryColor,
                          textButton: 'Download',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // genre
            SliverPadding(
              padding: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                top: kDefaultPadding,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Genre: Action, Superhero, Anime,Romance, Thriller,...',
                  style: TextStyles.defaultStyle.medium.whiteTextColor,
                ),
              ),
            ),
            // description
            SliverPadding(
              padding: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                top: kItemPadding,
              ),
              sliver: SliverToBoxAdapter(
                child: Wrap(
                  children: [
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyles.defaultStyle.medium.whiteTextColor,
                    ),
                    Text(
                      'View more',
                      style: TextStyles.defaultStyle.semibold
                          .setColor(ColorPalette.primaryColor),
                    ),
                  ],
                ),
              ),
            ),
            // list actors
            SliverPadding(
              padding: const EdgeInsets.only(
                top: kDefaultPadding,
              ),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: actors.length,
                    itemBuilder: (context, index) {
                      Actor actor = actors[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: kDefaultPadding),
                        child: GestureDetector(
                          onTap: () => navigateToActorMoviesScreen(actor.name),
                          child: ItemActor(actor: actor),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              sliver: SliverToBoxAdapter(
                child: TabBar(
                  isScrollable: false,
                  labelColor: ColorPalette.primaryColor,
                  indicatorColor: ColorPalette.primaryColor,
                  unselectedLabelColor: ColorPalette.unratedColor,
                  labelStyle: TextStyles.defaultStyle.medium.setTextSize(16),
                  tabs: const [
                    Tab(
                      text: 'Trailers',
                    ),
                    Tab(
                      text: 'More Like This',
                    ),
                    Tab(
                      text: 'Comments',
                    ),
                  ],
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              sliver: SliverFillRemaining(
                child: TabBarView(
                  children: [
                    TrailerTab(),
                    MoreLikeThisTab(),
                    CommentsTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildItemBox(String prop) {
  return Container(
    margin: const EdgeInsets.only(right: kItemPadding),
    padding: const EdgeInsets.all(kMinPadding),
    decoration: BoxDecoration(
        border: Border.all(color: ColorPalette.primaryColor),
        borderRadius: BorderRadius.circular(kMinPadding)),
    child: Text(
      prop,
      style: TextStyles.defaultStyle.medium.setTextSize(15).setColor(
            ColorPalette.primaryColor,
          ),
    ),
  );
}
