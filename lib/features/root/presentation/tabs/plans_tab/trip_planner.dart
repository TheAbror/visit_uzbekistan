import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

//TODO

const cities = [
  'Tashkent',
  'Samarkand',
  'Bukhara',
  'Khiva',
  'Muynak',
];
const priceRange = [
  'Luxury',
  'Economy',
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
                TripPlannerItem(
                  title: 'Cities',
                  items: cities,
                  stateItem: state.selectedCities,
                  isSingleSelection: false,
                ),
                TripPlannerItem(
                  title: 'Price range',
                  items: priceRange,
                  stateItem: state.selectedPriceRange,
                  isSingleSelection: true,
                ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Food'),
                    Text('Transportation'),
                    Text('Accomodation'),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class TripPlannerItem extends StatelessWidget {
  final String title;
  final List<String> items;
  final dynamic stateItem;
  final bool isSingleSelection;

  const TripPlannerItem({
    super.key,
    required this.title,
    required this.items,
    required this.stateItem,
    required this.isSingleSelection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 10.h),
        Wrap(
          children: List.generate(
            items.length,
            (index) {
              bool isSelected = stateItem.contains(items[index]) ? true : false;

              Color backgroundColor = isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey.withOpacity(0.1);

              Color textColor = isSelected ? AppColors.float : Colors.black;

              return GestureDetector(
                onTap: () {
                  isSingleSelection
                      ? context.read<PlansBloc>().addPriceRange(items[index])
                      : context.read<PlansBloc>().addCity(items[index]);
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  margin: EdgeInsets.only(right: 8.w, bottom: 8.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Text(
                    items[index],
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
        SizedBox(height: 20.h),
      ],
    );
  }
}
