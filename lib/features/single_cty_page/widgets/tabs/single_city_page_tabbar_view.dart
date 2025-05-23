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
            ListView(
              padding: EdgeInsets.zero,
              children: [
                TitleDescReviews(
                  title: 'Samarkand',
                  reviews: '32 Reviews',
                ),
                SingleCityPageShortDesc(
                  shortDesc:
                      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries ''',
                ),
              ],
            ),
            BeforeTheTripTab(),
            OnTheAirportTab(),
            TransportationTab(),
            CityTab(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
