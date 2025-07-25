import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class CitiesTab extends StatelessWidget {
  const CitiesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SingleChildScrollView(
          child: BlocBuilder<CitiesTabBloc, CitiesTabState>(
            builder: (context, state) {
              if (state.blocProgress == BlocProgress.IS_LOADING) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state.citiesSearched.isEmpty) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                      child: Text(
                    'No results',
                    style: TextStyle(fontSize: 16.sp),
                  )),
                );
              }

              if (state.blocProgress == BlocProgress.FAILED) {
                return const SomethingWentWrong();
              }
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 95.h),
                child: Column(
                  children: [
                    CitiesTabSearchWidget(),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.h,
                        crossAxisSpacing: 8.h,
                        childAspectRatio: 0.85,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      itemCount: state.citiesSearched.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final singleItem = state.citiesSearched[index];

                        return GridViewItem(item: singleItem);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        CustomAppBar(
          title: 'Cities',
          color: AppColors.primary,
          height: 45.h,
        ),
      ],
    );
  }
}
