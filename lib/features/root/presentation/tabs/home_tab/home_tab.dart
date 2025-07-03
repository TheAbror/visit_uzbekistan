import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

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
              //AppBar
              HomeTabAppBar(),
              //must know
              if (state.filterItemsSelected.contains('Must know'))
                if (state.mustKnow.isNotEmpty)
                  HomeTabItems(
                    header: 'Must know',
                    item: state.mustKnow,
                    pageNamed: OpenPageNamed.mustKnow,
                  ),

              // useful apps
              if (state.filterItemsSelected.contains('Useful apps'))
                if (state.usefulApps.isNotEmpty)
                  HomeTabItems(
                    header: context.localizations.usefulApps,
                    item: state.usefulApps,
                    pageNamed: OpenPageNamed.usefulApp,
                  ),

              //places
              if (state.filterItemsSelected.contains('Places'))
                if (state.places.model.isNotEmpty)
                  HomeTabItems(
                    header: context.localizations.places,
                    item: state.places.model,
                    pageNamed: OpenPageNamed.places,
                  ),

              // articles
              if (state.filterItemsSelected.contains('Articles'))
                if (state.articles.model.articles.isNotEmpty)
                  HomeTabItems(
                    header: context.localizations.articles,
                    item: state.articles.model.articles,
                    pageNamed: OpenPageNamed.article,
                  ),
              if (state.articles.blocProgress == BlocProgress.IS_LOADING)
                Center(child: CircularProgressIndicator()),

              //tours
              if (state.filterItemsSelected.contains('Tours'))
                if (state.tours.model.isNotEmpty)
                  HomeTabItems(
                    header: context.localizations.tours,
                    item: state.tours.model,
                    pageNamed: OpenPageNamed.tours,
                  ),
            ],
          );
        },
      ),
    );
  }
}
