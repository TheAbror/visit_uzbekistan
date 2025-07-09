import 'package:visit_uzbekistan/core/bottomsheet/widgets/bottom_sheet_list_multiple_choice_item.dart';
import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class HomeTabAppBar extends StatelessWidget {
  const HomeTabAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.profilePage,
                  );
                },
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: AppColors.float,
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32.r),
                    child: Assets.images.maleAvatarPlaceholder.image(),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                context.localizations.hi,
                style: TextStyle(fontSize: 16.sp),
              ),
              Text(
                ' Williamson',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.favoritesPage,
                  );
                },
                child: Icon(IconsaxPlusLinear.heart),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return const HomeTabSearchFilter();
                    },
                  );
                },
                child: Icon(IconsaxPlusLinear.setting_3),
              ),
            ],
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}

class HomeTabSearchFilter extends StatelessWidget {
  const HomeTabSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(
            top: 8.h,
            bottom: 10.h,
            left: 20.w,
            right: 20.w,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: Colors.white,
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BottomSheetTopIcon(),
                SizedBox(height: 12.h),
                Center(
                  child: Text(
                    'Feed filter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    shrinkWrap: true,
                    itemCount: state.filterItemsAll.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = state.filterItemsAll[index];

                      bool isSelected =
                          state.filterItemsSelected.contains(item);

                      return BottomSheetListMultipleChoiceItem(
                        itemTitle: item,
                        isSelected: isSelected,
                        onChanged: (value) {
                          context.read<HomeBloc>().homeTabFilter(item);
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
