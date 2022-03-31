import 'package:bwa_cozy/models/city.dart';
import 'package:bwa_cozy/models/spaces.dart';
import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/providers/space_provider.dart';
import 'package:bwa_cozy/themes/theme.dart';
import 'package:bwa_cozy/widgets/bottom_navbar.dart';
import 'package:bwa_cozy/widgets/city_card.dart';
import 'package:bwa_cozy/widgets/space_card.dart';
import 'package:bwa_cozy/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            // NOTE:  HEADER
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE:  Popular Cities
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/cities/cities_1.png',
                      isPopular: false)),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/cities/cities_2.png',
                      isPopular: true)),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/cities/cities_3.png',
                      isPopular: false)),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            // NOTE: Recomended Space
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recomended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, AsyncSnapshot<List<Space>> snapshot) {
                  if (snapshot.hasData) {
                    List<Space>? data = snapshot.data;
                    return Column(
                      children: data!
                          .map((item) => Container(
                                margin: EdgeInsets.only(bottom: 14),
                                child: SpaceCard(item),
                              ))
                          .toList(),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            // Note: Tips & Guidance
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TipsCard(Tips(
                      id: 1,
                      imageUrl: 'assets/ilustrations/tips_1.png',
                      title: 'City Guidelines',
                      updatedAt: '20 Apr')),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(Tips(
                      id: 1,
                      imageUrl: 'assets/ilustrations/tips_2.jpg',
                      title: 'Jakarta Fairship',
                      updatedAt: '11 Des')),
                ],
              ),
            ),
            SizedBox(
              height: 60 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 60,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
            color: Color(0xFFF6F7F8), borderRadius: BorderRadius.circular(22)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbar(
                imageUrl: 'assets/icons/icon_home_solid.png', isActive: false),
            BottomNavbar(
                imageUrl: 'assets/icons/icon_mail_solid.png', isActive: false),
            BottomNavbar(
                imageUrl: 'assets/icons/icon_card_solid.png', isActive: false),
            BottomNavbar(
                imageUrl: 'assets/icons/icon_love_solid.png', isActive: false),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
