import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class CitiesTab extends StatelessWidget {
  const CitiesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CitiesTabBloc, CitiesTabState>(
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return Center(child: CircularProgressIndicator());
          }

          if (state.blocProgress == BlocProgress.FAILED) {
            return const SomethingWentWrong();
          }

          return ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            children: [
              Container(
                height: 56.h,
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white,
                  boxShadow: AppColors.defaultShadowForItems,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Icon(IconsaxPlusLinear.search_normal_1),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          context.read<CitiesTabBloc>().search(value);
                        },
                        decoration: InputDecoration(
                          hintText: context.localizations.search,
                          border: InputBorder.none,
                          isDense: true,
                          hintStyle: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.lightGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              state.citiesSearched.isEmpty
                  ? Container(
                      margin: EdgeInsets.only(top: 300.h),
                      child: Center(
                        child: Text('No results'),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.h,
                        crossAxisSpacing: 8.h,
                        childAspectRatio: 0.85,
                      ),
                      itemCount: state.citiesSearched.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final singleItem = state.citiesSearched[index];

                        return GridViewItem(item: singleItem);
                      },
                    ),
            ],
          );
        },
      ),
    );
  }
}
