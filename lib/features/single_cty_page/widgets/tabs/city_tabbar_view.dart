import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class AboutCityTab extends StatelessWidget {
  const AboutCityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            // TitleDescReviews(
            //   title: state.response.name,
            //   reviews: '32 Reviews',
            // ),
            // SingleCityPageShortDesc(
            //   shortDesc: state.response.info,
            // ),

            HtmlWidget(state.response.info),
          ],
        );
      },
    );
  }
}

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

            return GridViewItem(item: singleItem);
          },
        );
      },
    );
  }
}

class PlacesTab extends StatelessWidget {
  const PlacesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        if (state.response.places.isEmpty) {
          return Padding(
            padding: EdgeInsets.only(bottom: 50.h),
            child: Center(
              child: Text('No places found'),
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
          itemCount: state.response.places.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final singleItem = state.response.places[index];

            return GridViewItem(item: singleItem);
          },
        );
      },
    );
  }
}
