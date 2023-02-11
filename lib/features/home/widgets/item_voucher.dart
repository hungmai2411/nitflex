import 'package:flutter/material.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';

class ItemVoucher extends StatelessWidget {
  final EdgeInsetsGeometry? margin;

  const ItemVoucher({
    super.key,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          kItemPadding,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                kTopPadding,
              ),
              child: Image.network(
                'https://plus.unsplash.com/premium_photo-1670509045675-af9f249b1bbe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dm91Y2hlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: kDefaultPadding),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mova Notification',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.defaultStyle.semibold.whiteTextColor
                      .setTextSize(17),
                ),
                const SizedBox(height: 10),
                Text(
                  'You have received a voucher code',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.defaultStyle.regular.whiteTextColor
                      .setTextSize(15),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    DateTime.now().toString(),
                    style:
                        TextStyles.defaultStyle.medium.setTextSize(13).setColor(
                              ColorPalette.textColor.withOpacity(0.5),
                            ),
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(width: kDefaultPadding),
          // Expanded(
          //   child: Align(
          //     alignment: Alignment.topCenter,
          //     child: Text(
          //       movie.dateTime,
          //       style: TextStyles.defaultStyle.medium.setTextSize(13).setColor(
          //             ColorPalette.textColor.withOpacity(0.5),
          //           ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
