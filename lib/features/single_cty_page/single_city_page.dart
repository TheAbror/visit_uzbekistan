import 'package:visit_uzbekistan/widget_imports.dart';

class SignleCityPage extends StatelessWidget {
  final int cityID;

  const SignleCityPage({
    super.key,
    required this.cityID,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 7,
        child: BlocProvider(
          create: (context) => SingleCityBloc()..getSingleCity(cityID),
          child: BlocBuilder<SingleCityBloc, SingleCityState>(
            builder: (context, state) {
              if (state.blocProgress == BlocProgress.IS_LOADING) {
                return Center(child: CircularProgressIndicator());
              }

              if (state.blocProgress == BlocProgress.FAILED) {
                return const SomethingWentWrong();
              }
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: double.infinity,
                        state.response.photo,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  ArrowBackAndStarWidgets(),
                  _Body(
                    item: state.response,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final SingleCityResponse item;

  _Body({required this.item});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.35 - 55,
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
                    item.name,
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
                item.shortDescription,
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
                  SingleCityTab(label: 'Restaurants'),
                  SingleCityTab(label: 'Hotels'),
                  SingleCityTab(label: 'Car rental'),
                  SingleCityTab(label: 'Tours'),
                  SingleCityTab(label: 'Tours1'),
                  SingleCityTab(label: 'Tours2'),
                ],
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
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
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
