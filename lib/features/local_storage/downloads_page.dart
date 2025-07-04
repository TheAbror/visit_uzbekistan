import 'package:visit_uzbekistan/features/local_storage/widgets/delete_dialog.dart';
import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved items'),
        leading: SingleCityPageLeadingIcon(),
        actions: [
          IconButton(
            onPressed: () async {
              final bool? isDelete = await deleteDialog(context);

              if (isDelete != null && isDelete) {
                await hiveBox.delete(ShPrefKeys.localStorageItems);
                showMessage('Deleted');
              }
            },
            icon: Icon(IconsaxPlusLinear.box_remove),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: hiveBox.listenable(),
        builder: (context, Box box, _) {
          final LocalStorage? data = box.get(ShPrefKeys.localStorageItems);
          final items = data?.localStorageItems ?? [];

          if (items.isEmpty) {
            return Center(
              child: Text(
                'No saved items',
                style: TextStyle(fontSize: 18.sp),
              ),
            );
          }

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
                  Navigator.pushNamed(
                    context,
                    AppRoutes.singleDownloadPage,
                    arguments: IdandTitle(
                      id: singleItem.id,
                      title: singleItem.type ?? '',
                    ),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                  ),
                                ),
                                if (singleItem.rating != null &&
                                    singleItem.rating != 0) ...[
                                  Row(
                                    children: [
                                      Text(singleItem.rating.toString()),
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
        },
      ),
    );
  }
}
