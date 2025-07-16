import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

const cities = [
  'Tashkent',
  'Samarkand',
  'Bukhara',
  'Khiva',
  'Muynak',
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
            return ListView(
              padding: EdgeInsets.all(8.w),
              children: [
                Text(
                  'Cities',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Wrap(
                  children: List.generate(
                    cities.length,
                    (index) {
                      bool isSelected =
                          state.selectedCities.contains(cities[index])
                              ? true
                              : false;

                      Color backgroundColor = isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey.withOpacity(0.1);

                      Color textColor =
                          isSelected ? AppColors.float : Colors.black;

                      return GestureDetector(
                        onTap: () {
                          context.read<PlansBloc>().addCity(cities[index]);
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          margin: EdgeInsets.only(right: 8.w, bottom: 8.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Text(
                            cities[index],
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: textColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
