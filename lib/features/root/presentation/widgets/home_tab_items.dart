import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class HomeTabItems extends StatelessWidget {
  final String header;
  final OpenPageNamed pageNamed;
  final List<SingleItemResponse> item;

  const HomeTabItems({
    super.key,
    required this.item,
    required this.header,
    this.pageNamed = OpenPageNamed.singleCity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndViewAllWidget(
          title: header,
          openPageNamed: pageNamed,
        ),
        Container(
          height: 220.h,
          margin: EdgeInsets.only(bottom: 8.h),
          width: double.infinity,
          child: ListView.builder(
            itemCount: pageNamed == OpenPageNamed.usefulApp ? 5 : item.length,
            padding: EdgeInsets.only(left: 8.w),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final singleItem = item[index];

              return ItemInfo(
                item: singleItem,
                onTap: () {
                  final String routeName = getRouteNameFromType(
                    singleItem.type ?? 'none',
                  );

                  Navigator.pushNamed(
                    context,
                    routeName,
                    arguments: singleItem.id,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class ItemInfo extends StatelessWidget {
  final SingleItemResponse item;
  final VoidCallback? onTap;

  const ItemInfo({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final _height = 160;
    final _width = 240;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        width: _width.w,
        decoration: BoxDecoration(
          color: AppColors.float,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageAndFavoriteIcon(
              height: _height,
              width: _width,
              item: item,
            ),
            SizedBox(height: 3.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //title
                        Expanded(
                          child: Text(
                            item.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        //rating
                        if (item.rating != null && item.rating != 0) ...[
                          SizedBox(height: 2.h),
                          Row(
                            children: [
                              Text(item.rating.toString()),
                              SizedBox(width: 2.w),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Colors.amber,
                                size: 16.sp,
                              ),
                            ],
                          ),
                        ]
                      ],
                    ),
                    SizedBox(height: 2.h),
                    //description
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
                    //location
                    if (item.location.isNotEmpty) ...[
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Icon(
                            IconsaxPlusLinear.location,
                            size: 11.sp,
                          ),
                          SizedBox(width: 3.w),
                          Flexible(
                            child: Text(
                              item.location,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
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
            ),
          ],
        ),
      ),
    );
  }
}

class ImageAndFavoriteIcon extends StatelessWidget {
  final int? _width;
  final int _height;
  final SingleItemResponse item;

  const ImageAndFavoriteIcon({
    super.key,
    int width = 240,
    required int height,
    required this.item,
  })  : _height = height,
        _width = width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          child: Image.network(
            height: _height.h,
            width: _width == null ? double.infinity : _width.w,
            fit: item.isImageTiny == true ? BoxFit.fitWidth : BoxFit.fill,
            //error case
            errorBuilder: (
              BuildContext context,
              Object exception,
              StackTrace? stackTrace,
            ) {
              return Container(
                height: _height.h,
                width: _width == null ? double.infinity : _width.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/sign_in_bg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            //loader case
            loadingBuilder: (
              BuildContext context,
              Widget child,
              ImageChunkEvent? loadingProgress,
            ) {
              if (loadingProgress == null) return child;
              return SizedBox(
                height: _height.h,
                width: _width == null ? double.infinity : _width.w,
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
                    state.favoritesInitial.contains(item)
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
    );
  }
}
