import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class PlansTab extends StatelessWidget {
  const PlansTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlansBloc(),
      child: Column(
        children: [
          TabsAppBar(text: context.localizations.plans),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
              children: [
                //places

                BlocBuilder<CitiesTabBloc, CitiesTabState>(
                  builder: (context, state) {
                    return HomeTabItems(
                      header: 'Discover Uzbekistan',
                      item: state.cities,
                      pageNamed: OpenPageNamed.places,
                    );
                  },
                ),

                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text(
                    'Quick access',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          QuickAccesssItem(
                            onTap: () {},
                            text: 'Map',
                            icon: IconsaxPlusLinear.map_1,
                          ),
                          SizedBox(width: 12.w),
                          QuickAccesssItem(
                            onTap: () {},
                            text: 'Currency',
                            icon: IconsaxPlusLinear.dollar_circle,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          QuickAccesssItem(
                            onTap: () {},
                            text: 'Transportation',
                            icon: IconsaxPlusLinear.car,
                          ),
                          SizedBox(width: 12.w),
                          QuickAccesssItem(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.tripPlannerPage,
                              );
                            },
                            text: 'Trip planner',
                            icon: IconsaxPlusLinear.map,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // CurrencyExchangeCalculator(),
                // SizedBox(height: 10.h),
                // TaxRefundInfo(),
                // SizedBox(height: 10.h),
                // TransportationOptions(),
                // SizedBox(height: 10.h),

                SizedBox(height: 60.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuickAccesssItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const QuickAccesssItem({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.float,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 4.w),
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
