import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class RestaurantsTab extends StatelessWidget {
  const RestaurantsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        if (state.response.restaurants.isEmpty) {
          return Padding(
            padding: EdgeInsets.only(bottom: 50.h),
            child: Center(
              child: Text('No restaurants found'),
            ),
          );
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.h,
            crossAxisSpacing: 8.h,
            childAspectRatio: 0.85,
          ),
          itemCount: state.response.restaurants.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final singleItem = state.response.restaurants[index];

            return GridViewItem(
              item: singleItem,
              moreID: state.response.id,
            );
          },
        );
      },
    );
  }
}
