import 'package:bwa_cozy/models/spaces.dart';
import 'package:bwa_cozy/pages/detail_page.dart';
import 'package:bwa_cozy/themes/theme.dart';
import 'package:flutter/material.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => DetailPage(space: space)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.network(
                    space.imageUrl!,
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/icon_star_solid.png',
                              width: 18,
                              height: 18,
                            ),
                            Text(
                              '${space.rating}/5',
                              style: whiteTextStyle.copyWith(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  space.name!,
                  style: blackTextStyle.copyWith(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
                SizedBox(
                  height: 2,
                ),
                Text.rich(TextSpan(
                    text: '\$${space.price}',
                    style: purpleTextStyle.copyWith(fontSize: 14),
                    children: [
                      TextSpan(
                          text: ' / month',
                          style: greyTextStyle.copyWith(fontSize: 16))
                    ])),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '${space.city}, ${space.country}',
                  style: greyTextStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
