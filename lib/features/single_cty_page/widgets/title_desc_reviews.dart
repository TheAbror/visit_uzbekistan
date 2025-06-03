import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class TitleDescReviews extends StatelessWidget {
  final String title;
  final String reviews;

  const TitleDescReviews({
    super.key,
    required this.title,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          // Spacer(),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(16),
          //     border: Border.all(color: AppColors.borderDividerColor),
          //   ),
          //   padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          //   child: Row(
          //     children: [
          //       Text(
          //         reviews,
          //         style: TextStyle(fontSize: 12.sp),
          //       ),
          //       SizedBox(width: 4),
          //       SvgPicture.asset('assets/icons/single_city/arrow-right.svg'),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class SingleCityPageShortDesc extends StatelessWidget {
  final String shortDesc;

  const SingleCityPageShortDesc({
    super.key,
    required this.shortDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: defaultPadding,
        right: defaultPadding,
        bottom: 8.h,
      ),
      child: Text(
        shortDesc,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.miscellaneousTabUnselected,
        ),
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
