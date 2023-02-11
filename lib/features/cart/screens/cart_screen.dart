import 'package:flutter/material.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/data/list_movies.dart';
import 'package:niflex/features/cart/screens/choose_method_screen.dart';
import 'package:niflex/features/cart/widgets/item_cart.dart';
import 'package:niflex/features/home/widgets/item_notification.dart';
import 'package:niflex/models/movie.dart';
import 'package:niflex/providers/cart_provider.dart';
import 'package:niflex/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  static const String routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    List<Movie> movies = context.watch<CartProvider>().movies;
    double totalPrice = 0;

    for (var movie in movies) {
      totalPrice += movie.price;
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
              'Check Out',
              style: TextStyles.defaultStyle.semibold.whiteTextColor
                  .setTextSize(19),
            ),
            centerTitle: false,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ItemCart(
                    movie: movies[index],
                    margin: const EdgeInsets.only(bottom: kDefaultPadding),
                  );
                },
                childCount: movies.length,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                //0xFF18191F
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    height: 100.0,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$totalPrice \$',
                          style: TextStyles.defaultStyle.semibold
                              .setTextSize(18)
                              .whiteTextColor,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ChooseMethodScreen.routeName);
                          },
                          child: CustomButton(
                            color: ColorPalette.primaryColor,
                            icon: null,
                            textButton: 'Check Out',
                          ),
                        ),
                      ],
                    ),
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
