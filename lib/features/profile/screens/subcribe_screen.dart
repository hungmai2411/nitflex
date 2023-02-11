import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/features/cart/screens/choose_method_screen.dart';

class SubcribeScreen extends StatefulWidget {
  const SubcribeScreen({super.key});

  static const String routeName = '/subcribe_screen';

  @override
  State<SubcribeScreen> createState() => _SubcribeScreenState();
}

class _SubcribeScreenState extends State<SubcribeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: ListView(
        children: [
          Text(
            'Subcribe to Preminum',
            style: TextStyles.defaultStyle.bold
                .setColor(ColorPalette.primaryColor)
                .setTextSize(20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Enjoy watching Full-HD movies, without\nrestrictions and without ads',
            style: TextStyles.defaultStyle.regular
                .setColor(Colors.white)
                .setTextSize(16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          itemPreminum('\$9.99', ' / month'),
          const SizedBox(height: 20),
          itemPreminum('\$99.99', ' / year'),
        ],
      ),
    );
  }

  Widget itemPreminum(String price, String unit) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ChooseMethodScreen.routeName,
          arguments: true,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorPalette.primaryColor,
          ),
          borderRadius: BorderRadius.circular(13),
        ),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Icon(
              FontAwesomeIcons.crown,
              color: ColorPalette.primaryColor,
              size: 40,
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: price,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23)),
                      TextSpan(text: unit),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Divider(
                  color: ColorPalette.dividerColor,
                ),
                const itemInfo(info: 'Watch all you want. Ad-free'),
                const itemInfo(info: 'Allows streaming of 4K'),
                const itemInfo(info: 'Video & Audio Quality is Better'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class itemInfo extends StatelessWidget {
  final String info;
  const itemInfo({
    required this.info,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.check,
          color: ColorPalette.primaryColor,
        ),
        const SizedBox(width: 10),
        Text(
          info,
          style: TextStyles.defaultStyle.medium.whiteTextColor,
        ),
      ],
    );
  }
}
