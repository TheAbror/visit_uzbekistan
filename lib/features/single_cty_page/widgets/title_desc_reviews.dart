import 'package:visit_uzbekistan/widget_imports.dart';

class TitleDescReviews extends StatelessWidget {
  const TitleDescReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text(
            'item.name',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderDividerColor),
            ),
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: Row(
              children: [
                Text(
                  '32 Reviews',
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(width: 4),
                SvgPicture.asset('assets/icons/single_city/arrow-right.svg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
