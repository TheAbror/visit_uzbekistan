import 'package:visit_uzbekistan/widget_imports.dart';

class SingleCityPageTabBarView extends StatelessWidget {
  const SingleCityPageTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding,
          top: 10.h,
        ),
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            AboutCityTab(),
            BeforeTheTripTab(),
            TransportationTab(),
            OnTheAirportTab(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}

class AboutCityTab extends StatelessWidget {
  const AboutCityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        TitleDescReviews(
          title: 'Urgench',
          reviews: '32 Reviews',
        ),
        SingleCityPageShortDesc(
          shortDesc:
              '''Urgench is a district-level city in western Uzbekistan. It is the capital of Xorazm Region. The estimated population of Urgench in 2021 was 145,000, an increase from 139,100 in 1999. It lies on the Amu Darya River and the Shavat canal. The city is situated 450 km west of Bukhara across the Kyzylkum Desert. Wikipedia

Population: 153,124 (2024) United Nations

Area code: (+998) 62

Postal code: 220100

Region: Khorazm Region''',
        ),
      ],
    );
  }
}
