import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

const cities = [
  'Tashkent',
  'Samarkand',
  'Bukhara',
  'Khiva',
  'Muynak',
];
const priceRange = [
  'Economy',
  'Regular',
];

class TripPlannerPage extends StatelessWidget {
  const TripPlannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trip planner'),
        leading: SingleCityPageLeadingIcon(),
        elevation: 1,
      ),
      body: BlocProvider(
        create: (context) => PlansBloc(),
        child: BlocBuilder<PlansBloc, PlansState>(
          builder: (context, state) {
            return Stack(
              children: [
                ListView(
                  padding: EdgeInsets.all(8.w),
                  children: [
                    TripPlannerItem(
                      title: 'Cities',
                      items: cities,
                      stateItem: state.selectedCities,
                    ),
                    if (state.selectedCities.isNotEmpty)
                      TripPlannerDays(
                        title: 'Days in each city',
                        items: state.selectedCities,
                      ),
                    SizedBox(height: 5.h),
                    Divider(
                      height: 6.h,
                      thickness: 0.5,
                      color: AppColors.iconColor,
                    ),
                    SizedBox(height: 5.h),

                    PriceRangeWidget(state: state),
                    SizedBox(height: 5.h),
                    Divider(
                      height: 6.h,
                      thickness: 0.5,
                      color: AppColors.iconColor,
                    ),
                    SizedBox(height: 5.h),

                    if (state.isFinalCostReady) ...[
                      Text(
                        'Estimated cost',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Divider(
                        height: 6.h,
                        thickness: 0.5,
                        color: AppColors.iconColor,
                      ),
                      SizedBox(height: 5.h),
                    ],

                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text('Food'),
                    //     Text('Transportation'), - transportation inside city
                    //                            options bus - economy, taxi - regular

                    //.         transportation between cities
                    //                Train, Plane
                    //     Text('Accomodation'),
                    //   ],
                    // ),
                  ],
                ),
                Positioned(
                  bottom: 20.h,
                  left: 8.w,
                  right: 8.w,
                  child: ActionButton(
                    text: 'Calculate',
                    onPressed: () {},
                    isAnotherColor: true,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
