import 'package:visit_uzbekistan/widget_imports.dart';

class AboutCityTab extends StatelessWidget {
  const AboutCityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            TitleDescReviews(
              title: state.response.name,
              reviews: '32 Reviews',
            ),
            SingleCityPageShortDesc(
              shortDesc: state.response.info,
            ),
          ],
        );
      },
    );
  }
}

class RestaurantsTab extends StatelessWidget {
  const RestaurantsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.h,
            crossAxisSpacing: 8.h,
            childAspectRatio: 0.82,
          ),
          itemCount: state.response.restaurants.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final singleItem = state.response.restaurants[index];

            return GridViewItem(item: singleItem);
          },
        );
      },
    );
  }
}

class PlacesTab extends StatelessWidget {
  const PlacesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.h,
            crossAxisSpacing: 8.h,
            childAspectRatio: 0.833,
          ),
          itemCount: state.response.places.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final singleItem = state.response.places[index];

            return GridViewItem(item: singleItem);
          },
        );
      },
    );
  }
}

// class _GridViewItem extends StatelessWidget {
//   final SingleItemResponse item;

//   const _GridViewItem({
//     required this.item,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(
//           context,
//           AppRoutes.singleCityPage,
//           arguments: item.id,
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: AppColors.rootBgColor,
//           borderRadius: BorderRadius.circular(12.r),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image + Favorite Icon
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(12.r),
//                     topRight: Radius.circular(12.r),
//                   ),
//                   child: Image.network(
//                     item.photo,
//                     fit: item.isImageTiny == true
//                         ? BoxFit.fitWidth
//                         : BoxFit.cover,
//                     height: 120.h,
//                     width: double.infinity,
//                     errorBuilder: (context, error, stackTrace) => Container(
//                       height: 120.h,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/sign_in_bg.jpg'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     loadingBuilder: (context, child, loadingProgress) {
//                       if (loadingProgress == null) return child;
//                       return SizedBox(
//                         height: 120.h,
//                         width: double.infinity,
//                         child: Center(
//                           child: CircularProgressIndicator(
//                             value: loadingProgress.expectedTotalBytes != null
//                                 ? loadingProgress.cumulativeBytesLoaded /
//                                     loadingProgress.expectedTotalBytes!
//                                 : null,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 // Favorite Icon
//                 Positioned(
//                   top: 4.h,
//                   right: 4.w,
//                   child: BlocBuilder<RootBloc, RootState>(
//                     builder: (context, state) {
//                       final isFavorite = state.favorites.contains(item);
//                       return GestureDetector(
//                         onTap: () {
//                           context.read<RootBloc>().addFavorite(item, context);
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.all(4),
//                           decoration: BoxDecoration(
//                             color: AppColors.float,
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                           child: Icon(
//                             isFavorite
//                                 ? IconsaxPlusBold.heart
//                                 : IconsaxPlusLinear.heart,
//                             size: 18.sp,
//                             color: Colors.red,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             // Item Details
//             Padding(
//               padding: EdgeInsets.all(8.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     item.name,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 13.sp,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 2.h),
//                   Text(
//                     item.shortDescription,
//                     style: TextStyle(
//                       fontSize: 11.sp,
//                       color: AppColors.miscellaneousTabUnselected,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 4.h),
//                   if (item.location.isNotEmpty)
//                     Row(
//                       children: [
//                         Icon(
//                           IconsaxPlusLinear.location,
//                           size: 14.sp,
//                         ),
//                         SizedBox(width: 4.w),
//                         Flexible(
//                           child: Text(
//                             item.location,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 11.sp,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                   if (item.rating != null && item.rating != 0) ...[
//                     SizedBox(height: 4.h),
//                     Row(
//                       children: [
//                         Text(
//                           'Rating: ',
//                           style: TextStyle(fontSize: 11.sp),
//                         ),
//                         Text(
//                           item.rating.toString(),
//                           style: TextStyle(
//                             fontSize: 11.sp,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
