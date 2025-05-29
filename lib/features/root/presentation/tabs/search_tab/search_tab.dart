import 'package:visit_uzbekistan/widget_imports.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<RootBloc, RootState>(
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return Center(child: CircularProgressIndicator());
          }

          // if (state.blocProgress == BlocProgress.FAILED) {
          //   return const SomethingWentWrong();
          // }

          return ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            children: [
              Container(
                height: 56.h,
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Icon(IconsaxPlusLinear.search_normal_1),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: TextField(
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
              if (state.favorites.isNotEmpty)
                HomeTabItems(
                    header: context.localizations.favorites,
                    item: state.favorites),
            ],
          );
        },
      ),
    );
  }
}
