import 'package:visit_uzbekistan/core/bottomsheet/widgets/bottom_sheet_list_multiple_choice_item.dart';
import 'package:visit_uzbekistan/widget_imports.dart';

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
              Text(
                'Hi',
                style: TextStyle(fontSize: 16.sp),
              ),
              Text(
                ' Williamson,',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Container(
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
            ],
          ),
          SizedBox(height: 12.h),
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
                SizedBox(width: 16.w),
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
          ),
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
