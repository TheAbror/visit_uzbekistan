import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class GridViewItem extends StatelessWidget {
  final SingleItemResponse item;
  final int? moreID;

  const GridViewItem({required this.item, this.moreID});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final String? routeName = getRouteNameFromType(
          item.type,
        );

        if (routeName == null || routeName == '') {
          showMessage('Error ', isError: true);
        } else {
          Navigator.pushNamed(
            context,
            routeName,
            arguments: IdandTitle(
              id: item.id,
              title: item.name,
              moreID: moreID,
            ),
          );
        }
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
            ImageAndFavoriteIcon(
              height: 120,
              item: item,
            ),

            // Item Details
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.h,
                vertical: 2.h,
              ),
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
                  Text(
                    item.shortDescription,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColors.miscellaneousTabUnselected,
                    ),
                    maxLines: item.location.isEmpty ? 3 : 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (item.shortDescription.length < 27) SizedBox(height: 17.h),
                  if (item.location.isNotEmpty) ...[
                    SizedBox(height: 8.h),
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
