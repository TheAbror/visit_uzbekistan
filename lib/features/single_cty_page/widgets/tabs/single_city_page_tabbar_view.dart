import 'package:visit_uzbekistan/widget_imports.dart';

class SingleCityPageTabBarView extends StatelessWidget {
  const SingleCityPageTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
