import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class ReviewsTab extends StatefulWidget {
  const ReviewsTab({super.key});

  @override
  State<ReviewsTab> createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {
  @override
  void initState() {
    super.initState();
    context.read<CityBloc>().getReviews();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            Text(
              'Reviews & Ratings',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 12.h),
              itemCount: state.reviews.data.length,
              itemBuilder: (context, index) {
                final item = state.reviews.data[index];

                return UserCommnet(
                  userName: item.userID.toString(),
                  createdAt: item.createdAt,
                  comment: item.comment,
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey.withOpacity(0.15),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

// Positioned(
//               bottom: 40.h,
//               child: ActionButton(
//                 text: 'Submit review',
//                 onPressed: () {
//                   Navigator.pushNamed(context, AppRoutes.addreviewPage);
//                 },
//               ),
//             )

class UserCommnet extends StatelessWidget {
  final String userName;
  final String createdAt;
  final String comment;

  const UserCommnet({
    super.key,
    required this.userName,
    required this.createdAt,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4.h),
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
                  userName,
                  style: TextStyle(fontSize: 14.sp),
                ),
                Text(
                  createdAt.humanReadable,
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
          comment,
          style: TextStyle(fontSize: 14.sp),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
