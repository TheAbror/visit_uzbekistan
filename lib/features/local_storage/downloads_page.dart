import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DownloadsAppBar(),
      body: DownloadsBody(),
    );
  }
}

class DownloadsBody extends StatelessWidget {
  const DownloadsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hiveBox.listenable(),
      builder: (context, Box hiveBox, _) {
        final rawItemData = hiveBox.get(ShPrefKeys.localStorageItems);
        final LocalStorage? itemData = rawItemData;
        final localStorageItems = itemData?.localStorageItems ?? [];

        return ValueListenableBuilder(
          valueListenable: savedCitiesBox.listenable(),
          builder: (context, Box box, _) {
            final rawCityData = box.get(ShPrefKeys.localStorageSavedCity);
            final LocalStorageForCities? cityData = rawCityData;
            final cityItems = cityData?.localStorageCityItems ?? [];

            final allItems = [
              ...localStorageItems,
              ...cityItems,
            ];

            if (allItems.isEmpty) {
              return Center(
                child: Text(
                  'No saved items',
                  style: TextStyle(fontSize: 18.sp),
                ),
              );
            }

            return _Body(items: allItems);
          },
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  final dynamic items;

  const _Body({required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(
        left: defaultPadding,
        right: defaultPadding,
        top: 10.h,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 8.h,
        childAspectRatio: 0.85,
      ),
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final singleItem = items[index];

        return GestureDetector(
          onTap: () {
            if (singleItem.type == 'city') {
              Navigator.pushNamed(
                context,
                AppRoutes.singleCityPage,
                arguments: IdandTitle(
                  id: singleItem.id,
                  title: singleItem.type,
                ),
              );
            } else {
              Navigator.pushNamed(
                context,
                AppRoutes.singleDownloadPage,
                arguments: IdandTitle(
                  id: singleItem.id,
                  title: singleItem.type,
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
                  item: singleItem.toSingleItemResponse(),
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
                              singleItem.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        singleItem.shortDescription,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.miscellaneousTabUnselected,
                        ),
                        maxLines: singleItem.location.isEmpty ? 3 : 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (singleItem.shortDescription.length < 27)
                        SizedBox(height: 17.h),
                      if (singleItem.location.isNotEmpty) ...[
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
                                singleItem.location,
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
      },
    );
  }
}
