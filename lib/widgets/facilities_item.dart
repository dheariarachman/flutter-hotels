import 'package:bwa_cozy/themes/theme.dart';
import 'package:flutter/material.dart';

class FacilitiesItem extends StatelessWidget {
  final String imageUrl;
  final int countItem;
  final String itemTitle;

  FacilitiesItem(
      {required this.imageUrl,
      required this.countItem,
      required this.itemTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(TextSpan(
            text: '$countItem',
            style: purpleTextStyle,
            children: [TextSpan(text: ' $itemTitle', style: greyTextStyle)]))
      ],
    );
  }
}
