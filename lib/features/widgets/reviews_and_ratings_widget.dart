import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class ReviewsAndRatingsWidget extends StatelessWidget {
  const ReviewsAndRatingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(
          'Reviews & Ratings',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkrtQBXGauSHMKNR-H7uIGq5k7Par8k4scPw&s',
                width: 40.w,
                height: 40.w,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 200.h,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/sign_in_bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sophia Clark',
                  style: TextStyle(fontSize: 14.sp),
                ),
                Text(
                  '2 weeks ago',
                  style: TextStyle(fontSize: 12.sp, color: AppColors.iconColor),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/star_filled.svg'),
              SvgPicture.asset('assets/icons/star_filled.svg'),
              SvgPicture.asset('assets/icons/star_filled.svg'),
              SvgPicture.asset('assets/icons/star_filled.svg'),
              SvgPicture.asset('assets/icons/star_filled.svg'),
            ],
          ),
        ),
        Text(
          'Absolutely stunning! The castle is well-preserved, and the views are incredible. A must-visit for history buffs and anyone who appreciates beautiful architecture.',
          style: TextStyle(
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl:
                    'https://img.freepik.com/premium-vector/male-face-avatar-icon-set-flat-design-social-media-profiles_1281173-3806.jpg?semt=ais_hybrid&w=740',
                width: 40.w,
                height: 40.w,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 200.h,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/sign_in_bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ethan Bennett',
                  style: TextStyle(fontSize: 14.sp),
                ),
                Text(
                  '1 month ago',
                  style: TextStyle(fontSize: 12.sp, color: AppColors.iconColor),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/star_filled.svg'),
              SvgPicture.asset('assets/icons/star_filled.svg'),
              SvgPicture.asset('assets/icons/star_filled.svg'),
              SvgPicture.asset('assets/icons/star_filled.svg'),
              SvgPicture.asset('assets/icons/star_empty.svg'),
            ],
          ),
        ),
        Text(
          'Enjoyed my visit. The castle is impressive, but it can get crowded. Arrive early to avoid the crowds and fully enjoy the experience.',
          style: TextStyle(fontSize: 14.sp),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
