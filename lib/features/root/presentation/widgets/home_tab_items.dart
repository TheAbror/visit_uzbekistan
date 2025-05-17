import 'package:visit_uzbekistan/widget_imports.dart';

class HomeTabItems extends StatelessWidget {
  const HomeTabItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        return Container(
          height: 250.h,
          margin: EdgeInsets.only(bottom: 8.h),
          width: double.infinity,
          child: ListView.builder(
            itemCount: state.cities.length,
            padding: EdgeInsets.only(left: 8.w),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = state.cities[index];

              return ItemInfo(item: item);
            },
          ),
        );
      },
    );
  }
}

class ItemInfo extends StatelessWidget {
  final SingleCityResponse item;

  const ItemInfo({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.singleCityPage);
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
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.network(
                      height: 180.h, width: 280.w, fit: BoxFit.fill,
                      //                    errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                      //     return Text('Your error widget...');
                      // },

                      //   errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                      // return SizedBox();
                      //   },
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
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
                  },
                      // 'https://dynamic-media.tacdn.com/media/photo-o/2f/61/65/1f/caption.jpg?w=800&h=600&s=1',
                      item.photo),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                item.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Flexible(
                child: Text(
                  item.shortDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
