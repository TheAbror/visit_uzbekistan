import 'package:visit_uzbekistan/widget_imports.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return Center(child: CircularProgressIndicator());
          }

          // if (state.blocProgress == BlocProgress.FAILED) {
          //   return const SomethingWentWrong();
          // }

          return ListView(
            children: [
              if (state.cities.isNotEmpty)
                TitleAndViewAllWidget(
                  title: 'Cities',
                  onTap: () {},
                ),
              if (state.cities.isNotEmpty) HomeTabItems(item: state.cities),
              //
              if (state.places.isNotEmpty)
                TitleAndViewAllWidget(
                  title: 'Places',
                  onTap: () {},
                ),
              if (state.cities.isNotEmpty) HomeTabItems(item: state.places),
              // useful apps
              if (state.usefulApps.isNotEmpty)
                TitleAndViewAllWidget(
                  title: 'Useful apps',
                  onTap: () {},
                ),
              if (state.usefulApps.isNotEmpty)
                HomeTabItems(item: state.usefulApps),
            ],
          );
        },
      ),
    );
  }
}
