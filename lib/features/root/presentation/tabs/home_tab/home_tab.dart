import 'package:visit_uzbekistan/widget_imports.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeBloc(),
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
                    title: context.localizations.cities,
                    onTap: () {},
                  ),
                if (state.cities.isNotEmpty) HomeTabItems(item: state.cities),
                //
                if (state.places.isNotEmpty)
                  TitleAndViewAllWidget(
                    title: context.localizations.places,
                    onTap: () {},
                  ),
                if (state.cities.isNotEmpty) HomeTabItems(item: state.places),
                // useful apps
                if (state.usefulApps.isNotEmpty)
                  TitleAndViewAllWidget(
                    title: context.localizations.usefulApps,
                    onTap: () {},
                  ),
                if (state.usefulApps.isNotEmpty)
                  HomeTabItems(item: state.usefulApps),
                // articles
                if (state.articles.isNotEmpty)
                  TitleAndViewAllWidget(
                    title: context.localizations.articles,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.viewAllPage,
                      );
                    },
                  ),
                if (state.articles.isNotEmpty)
                  HomeTabItems(item: state.articles),
              ],
            );
          },
        ),
      ),
    );
  }
}
