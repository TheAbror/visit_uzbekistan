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

          if (state.blocProgress == BlocProgress.FAILED) {
            return const SomethingWentWrong();
          }

          return ListView(
            children: [
              //cities
              if (state.cities.isNotEmpty)
                HomeTabItems(
                  header: context.localizations.cities,
                  item: state.cities,
                  pageNamed: OpenPageNamed.singleCity,
                ),

              //please
              if (state.cities.isNotEmpty)
                HomeTabItems(
                  header: context.localizations.places,
                  item: state.places,
                ),

              // useful apps
              if (state.usefulApps.isNotEmpty)
                HomeTabItems(
                  header: context.localizations.usefulApps,
                  item: state.usefulApps,
                  pageNamed: OpenPageNamed.usefulApp,
                ),

              // articles
              if (state.articles.model.articles.isNotEmpty)
                HomeTabItems(
                  header: context.localizations.articles,
                  item: state.articles.model.articles,
                  pageNamed: OpenPageNamed.article,
                ),

              if (state.articles.blocProgress == BlocProgress.IS_LOADING)
                Center(child: CircularProgressIndicator())
            ],
          );
        },
      ),
    );
  }
}
