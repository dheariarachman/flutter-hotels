import 'package:bwa_cozy/models/spaces.dart';
import 'package:bwa_cozy/themes/theme.dart';
import 'package:bwa_cozy/widgets/facilities_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Space space;

  DetailPage({required this.space});

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl!,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: whiteColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      // Note: Title Detail Page
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: edge, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name!,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                Text.rich(TextSpan(
                                    text: '\$${space.price!}',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 14),
                                    children: [
                                      TextSpan(
                                          text: ' / month',
                                          style: greyTextStyle.copyWith(
                                              fontSize: 16))
                                    ])),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/icon_star_solid.png',
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/icons/icon_star_solid.png',
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/icons/icon_star_solid.png',
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/icons/icon_star_solid.png',
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/icons/icon_star_solid.png',
                                  width: 20,
                                  color: Color(0xFF989BA1),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //Note : Facilities
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Main Facilities',
                                style: blackTextStyle.copyWith(fontSize: 16)),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FacilitiesItem(
                                  countItem: space.numberOfKitchens!,
                                  imageUrl: 'assets/icons/bar-counter.png',
                                  itemTitle: 'Kitchen',
                                ),
                                FacilitiesItem(
                                  countItem: space.numberOfBedrooms!,
                                  imageUrl: 'assets/icons/double-bed.png',
                                  itemTitle: 'Bedroom',
                                ),
                                FacilitiesItem(
                                  countItem: space.numberOfCupboards!,
                                  imageUrl: 'assets/icons/cupboard.png',
                                  itemTitle: 'Big Case',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Photos',
                              style: blackTextStyle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: space.photos!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(left: edge),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    space.photos![index],
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location',
                              style: blackTextStyle.copyWith(fontSize: 16),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  space.address!,
                                  style: greyTextStyle,
                                ),
                                InkWell(
                                  onTap: () => _launchURL(space.mapUrl!),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Color(0xFFF6F7F8)),
                                    child: Icon(
                                      Icons.location_on,
                                      color: greyColor,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 42,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: edge),
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Color(0xFF5843BE),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17)),
                          ),
                          onPressed: () => _launchURL('tel:${space.phone}'),
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 42,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Center(
                          child: Image.asset(
                              'assets/icons/icon_left_outline.png',
                              width: 35)),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  InkWell(
                    onTap: () {
                      print('Clicked Love');
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Center(
                          child: Image.asset(
                        'assets/icons/icon_love_outline.png',
                        width: 30,
                      )),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
