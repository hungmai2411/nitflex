import 'package:flutter/material.dart';

class ItemBox extends StatelessWidget {
  final bool isPicked;
  final Function(int) callback;
  final int index;

  const ItemBox({
    super.key,
    required this.isPicked,
    required this.index,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback(index),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: isPicked
                  ? const AssetImage('assets/images/ic_checkedIn.png')
                  : const AssetImage('assets/images/ic_checkIn.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
