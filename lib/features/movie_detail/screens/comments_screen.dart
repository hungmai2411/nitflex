import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/data/list_comments.dart';
import 'package:niflex/features/movie_detail/widgets/item_comment.dart';
import 'package:niflex/features/movie_detail/widgets/send_comment.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});
  static const String routeName = '/comments_screen';
  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      ColorPalette.textColor = Colors.white;
      print('dark');
    } else {
      ColorPalette.textColor = const Color(0xFF212121);
      ColorPalette.backgroundScaffoldColor = Colors.white;
      ColorPalette.boxSearchColor = const Color(0xFFF5F5F4);
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
            '24.6K Comments',
            style:
                TextStyles.defaultStyle.semibold.whiteTextColor.setTextSize(19),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(
                right: kTopPadding,
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
          centerTitle: false,
        ),
        SliverFillRemaining(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: ((BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: kMediumPadding,
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                    ),
                    child: ItemComment(
                      comment: comments[index],
                    ),
                  );
                }),
                itemCount: comments.length,
              ),
              //0xFF18191F
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  height: 150.0,
                  padding: const EdgeInsets.all(kMediumPadding),
                  margin: const EdgeInsets.only(top: 6.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30.0),
                    ),
                    color: ColorPalette.backgroundScaffoldColor,
                    boxShadow: [
                      BoxShadow(
                        color: ColorPalette.textColor.withOpacity(0.5),
                        offset: const Offset(1.0, 1.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: SendComment(
                          commentController: commentController,
                        ),
                      ),
                      const SizedBox(width: kItemPadding),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: ColorPalette.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.send_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
    ;
  }
}
