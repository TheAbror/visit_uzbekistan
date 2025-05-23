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
          top: 8.h,
        ),
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
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
