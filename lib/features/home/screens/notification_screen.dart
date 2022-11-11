import 'package:flutter/material.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/data/list_movies.dart';
import 'package:niflex/features/home/widgets/item_notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    super.key,
  });

  static const String routeName = '/notification_screen';

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      ColorPalette.textColor = Colors.white;
      ColorPalette.backgroundScaffoldColor = const Color(0xFF171A20);

      print('dark');
    } else {
      ColorPalette.textColor = const Color(0xFF212121);
      ColorPalette.backgroundScaffoldColor = Colors.white;

      print('white');
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: ColorPalette.textColor,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: ColorPalette.backgroundScaffoldColor,
            title: Text(
              'Notification',
              style: TextStyles.defaultStyle.semibold.whiteTextColor
                  .setTextSize(19),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: kTopPadding,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorPalette.textColor,
                    ),
                  ),
                  child: Icon(
                    Icons.more_horiz,
                    color: ColorPalette.textColor,
                  ),
                ),
              ),
            ],
            centerTitle: false,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ItemNotification(
                    movie: movies[index],
                    margin: const EdgeInsets.only(bottom: kDefaultPadding),
                  );
                },
                childCount: movies.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
