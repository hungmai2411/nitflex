import 'package:flutter/material.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/data/list_movies.dart';
import 'package:niflex/features/cart/widgets/item_cart.dart';
import 'package:niflex/features/cart/widgets/item_payment.dart';
import 'package:niflex/features/explore/widgets/box_search.dart';
import 'package:niflex/features/home/widgets/item_notification.dart';
import 'package:niflex/main_app.dart';
import 'package:niflex/models/movie.dart';
import 'package:niflex/models/payment.dart';
import 'package:niflex/providers/cart_provider.dart';
import 'package:niflex/providers/my_list_provider.dart';
import 'package:niflex/utils.dart';
import 'package:niflex/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ChooseMethodScreen extends StatefulWidget {
  final bool isSubcribe;
  ChooseMethodScreen({
    super.key,
    this.isSubcribe = false,
  });

  static const String routeName = '/choose_method_screen';

  @override
  State<ChooseMethodScreen> createState() => _ChooseMethodScreenState();
}

class _ChooseMethodScreenState extends State<ChooseMethodScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Payment> payments = [
    Payment(
      img: 'assets/images/ic_visa.png',
      description: 'Lorem ipsum dolor sit amet.',
      name: 'Visa',
    ),
    Payment(
      img: 'assets/images/ic_zalo.png',
      description: 'Sed dictum lacus non quam.',
      name: 'Zalo Pay',
    ),
    Payment(
      img: 'assets/images/ic_pay_with_card.png',
      description: 'Vivamus non posuere diam.',
      name: 'Pay with Credit Card',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Movie> movies = context.watch<CartProvider>().movies;
    double totalPrice = 0;

    for (var movie in movies) {
      totalPrice += movie.price;
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
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
              'Choose Payment Method',
              style: TextStyles.defaultStyle.semibold.whiteTextColor
                  .setTextSize(19),
            ),
            centerTitle: false,
          ),
          SizedBox(
            height: 350,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: payments.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemPayment(
                    onTap: (p0) {
                      setState(() {
                        for (var payment in payments) {
                          if (p0.name == payment.name) {
                            payment.isPicked = true;
                          } else {
                            payment.isPicked = false;
                          }
                        }
                      });
                    },
                    payment: payments[index],
                    // margin: const EdgeInsets.only(bottom: kDefaultPadding),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              'Enter voucher code',
              style:
                  TextStyles.defaultStyle.medium.setTextSize(16).whiteTextColor,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: TextField(
              controller: searchController,
              enabled: true,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: 'Voucher code',
                hintStyle: TextStyles.defaultStyle.setColor(
                  ColorPalette.unratedColor,
                ),
                filled: true,
                fillColor: ColorPalette.boxSearchColor,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      kItemPadding,
                    ),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorPalette.primaryColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      kItemPadding,
                    ),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: kItemPadding),
              ),
              style: TextStyles.defaultStyle.setColor(
                ColorPalette.textColor,
              ),
              onSubmitted: (String submitValue) {},
            ),
          ),
          Expanded(
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
                            context.read<MyListProvider>().setList(movies);
                            context.read<CartProvider>().removeAll();

                            Navigator.of(context).pushNamed(MainApp.routeName);
                            showSnackBar(context, 'Buy successfully');
                          },
                          child: CustomButton(
                            color: ColorPalette.primaryColor,
                            icon: null,
                            textButton:
                                !widget.isSubcribe ? 'Check Out' : 'Continue',
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
