import 'package:visit_uzbekistan/widget_imports.dart';

class SignleCityPage extends StatelessWidget {
  static const routeName = '/single/city';
  // static String routeName = '/';

  const SignleCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQt5VjtiKK_Ersw6MMIWEmULmKh2eX8jToM384_6QqH018ZwyoYRrsSJu9wo7yuhp93bhj4doenkoIEnnPlGKzliPGihjz2Nsk7pfrdPA',
                  // height: MediaQuery.of(context).size.height * 0.3,
                  //@KH
                ),
              ],
            ),
            ArrowBackAndStarWidgets(),
            _Body(),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.3 - 55,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: AppColors.float,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Frankfurt am Main',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      // border: Border.all(color: AppColors.borderDividerColor),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    child: Row(
                      children: [
                        Text('32 Reviews'),
                        SizedBox(width: 4),
                        SvgPicture.asset(
                            'assets/icons/single_city/arrow-right.svg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Germany',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  // color: AppColors.miscellaneousTabUnselected,
                ),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 4),
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  labelColor: AppColors.float,
                  // unselectedLabelColor: AppColors.foregroundTertiaryRest,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.transparent,
                  indicatorPadding: EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 0,
                  ),
                  indicator: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  tabs: [
                    SingleCityTab(label: 'Before the trip'),
                    SingleCityTab(label: 'At the airport'),
                    SingleCityTab(label: 'Transportation'),
                    SingleCityTab(label: 'City'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Divider(
              height: 0.5,
              thickness: 0.5,
              // color: AppColors.dividerColor,
            ),
            SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBarView(
                  children: [
                    BeforeTheTripTab(),
                    OnTheAirportTab(),
                    TransportationTab(),
                    CityTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
