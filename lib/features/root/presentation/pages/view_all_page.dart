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
                  //
                  ListView.builder(
                    itemCount: state.favorites.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final singleItem = state.favorites[index];

                      return ItemInfo(item: singleItem);
                    },
                  ),
                ],
              );
            },
          ),
        ));
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
        margin: EdgeInsets.only(bottom: 4.w),
        height: 205.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.float,
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
                    width: double.infinity,
                    fit: item.isImageTiny == true
                        ? BoxFit.fitWidth
                        : BoxFit.fill,
                    errorBuilder: (
                      BuildContext context,
                      Object exception,
                      StackTrace? stackTrace,
                    ) {
                      return Container(
                        height: 180.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/sign_in_bg.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    loadingBuilder: (
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
                    },
                    item.photo,
                  ),
                ),
                BlocBuilder<RootBloc, RootState>(
                  builder: (context, state) {
                    return Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          context.read<RootBloc>().addFavorite(item, context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 4.w, top: 4.h),
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: AppColors.float,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            state.favorites.contains(item)
                                ? IconsaxPlusBold.heart
                                : IconsaxPlusLinear.heart,
                            size: 18.sp,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 3.h),
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
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.miscellaneousTabUnselected,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (item.cityID != null && item.cityID != 0)
                      SizedBox(height: 4.h),
                    if (item.location != '')
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
