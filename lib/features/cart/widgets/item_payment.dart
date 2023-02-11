import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/models/payment.dart';

class ItemPayment extends StatelessWidget {
  final Payment payment;
  final Function(Payment) onTap;

  const ItemPayment({
    super.key,
    required this.payment,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(payment),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorPalette.boxColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 18,
                top: 18,
                left: 20,
              ),
              child: Row(
                children: [
                  Image.asset(
                    payment.img,
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        payment.name,
                        style: TextStyles.defaultStyle.medium
                            .setTextSize(16)
                            .whiteTextColor,
                      ),
                      const SizedBox(height: 5),
                      Text(payment.description,
                          style: TextStyles.defaultStyle.regular
                              .setTextSize(12)
                              .setColor(const Color(0xFF7D8699))),
                    ],
                  ),
                ],
              ),
            ),
            payment.isPicked
                ? Positioned(
                    right: 10,
                    top: 10,
                    child: Image.asset(
                      'assets/images/ic_checked.png',
                      fit: BoxFit.cover,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
