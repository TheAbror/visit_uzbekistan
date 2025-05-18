import 'package:visit_uzbekistan/widget_imports.dart';

class HomeTabItems extends StatelessWidget {
  final List<SingleItemResponse> item;

  const HomeTabItems({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      margin: EdgeInsets.only(bottom: 8.h),
      width: double.infinity,
      child: ListView.builder(
        itemCount: item.length,
        padding: EdgeInsets.only(left: 8.w),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final singleItem = item[index];

          return ItemInfo(item: singleItem);
        },
      ),
    );
  }
}

class ItemInfo extends StatelessWidget {
  final SingleItemResponse item;

  const ItemInfo({
    super.key,
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
        margin: EdgeInsets.only(right: 8.w),
        height: 180.h,
        width: 280.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                  child: Image.network(
                      height: 180.h,
                      width: 280.w,
                      fit: BoxFit.fill, errorBuilder: (
                    BuildContext context,
                    Object exception,
                    StackTrace? stackTrace,
                  ) {
                    return Container(
                      height: 180.h,
                      width: 280.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/sign_in_bg.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // child: Center(
                      //   child: const Text(
                      //     'No results',
                      //     style: TextStyle(
                      //         color: AppColors.textMain,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                    );
                  }, loadingBuilder: (
                    BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress,
                  ) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      height: 180.h,
                      width: 280.w,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  }, item.photo),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 4.w, top: 4.h),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: AppColors.float,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.favorite_border_rounded,
                      size: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.h),
                    Text(
                      item.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2.h),
                    Flexible(
                      child: Text(
                        item.shortDescription,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (item.cityID != null && item.cityID != 0)
                      SizedBox(height: 4.h),
                    if (item.cityName != '')
                      Row(
                        children: [
                          Icon(
                            IconsaxPlusLinear.location,
                            size: 14.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            item.cityName ?? '',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    if (item.rating != null && item.rating != 0)
                      SizedBox(height: 4.h),
                    if (item.rating != null && item.rating != 0)
                      Row(
                        children: [
                          Text('Rating: '),
                          Text(item.rating.toString()),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
