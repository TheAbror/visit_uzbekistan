import 'package:visit_uzbekistan/widget_imports.dart';

class ViewAllPage extends StatelessWidget {
  const ViewAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocBuilder<RootBloc, RootState>(
          builder: (context, state) {
            if (state.blocProgress == BlocProgress.IS_LOADING) {
              return Center(child: CircularProgressIndicator());
            }

            if (state.favorites.isEmpty)
              return Expanded(
                child: Center(
                  child: Text('No results'),
                ),
              );

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
                    boxShadow: AppColors.defaultShadowForItems,
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
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.h,
                    crossAxisSpacing: 8.h,
                    childAspectRatio: 0.833,
                  ),
                  itemCount: state.favorites.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final singleItem = state.favorites[index];

                    return GridViewItem(item: singleItem);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class GridViewItem extends StatelessWidget {
  final SingleItemResponse item;

  const GridViewItem({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.singleCityPage,
          arguments: item.id,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.float,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: AppColors.defaultShadowForItems,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image + Favorite Icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                  child: Image.network(
                    item.photo,
                    fit: item.isImageTiny == true
                        ? BoxFit.fitWidth
                        : BoxFit.cover,
                    height: 120.h,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 120.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/sign_in_bg.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        height: 120.h,
                        width: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Favorite Icon
                Positioned(
                  top: 4.h,
                  right: 4.w,
                  child: BlocBuilder<RootBloc, RootState>(
                    builder: (context, state) {
                      final isFavorite = state.favorites.contains(item);
                      return GestureDetector(
                        onTap: () {
                          context.read<RootBloc>().addFavorite(item, context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.float,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            isFavorite
                                ? IconsaxPlusBold.heart
                                : IconsaxPlusLinear.heart,
                            size: 18.sp,
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            // Item Details
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                      ),
                      if (item.rating != null && item.rating != 0) ...[
                        Row(
                          children: [
                            Text(item.rating.toString()),
                            SizedBox(width: 2.w),
                            Icon(
                              IconsaxPlusBold.star,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    item.shortDescription,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColors.miscellaneousTabUnselected,
                    ),
                    maxLines: item.location.isEmpty ? 3 : 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (item.shortDescription.length < 20) SizedBox(height: 17.h),
                  if (item.location.isNotEmpty) ...[
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Icon(
                          IconsaxPlusLinear.location,
                          size: 14.sp,
                        ),
                        SizedBox(width: 4.w),
                        Flexible(
                          child: Text(
                            item.location,
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
