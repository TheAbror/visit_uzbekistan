import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class PlacePage extends StatefulWidget {
  final int id;

  const PlacePage({
    super.key,
    required this.id,
  });

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  @override
  void initState() {
    super.initState();

    context.read<PlaceBloc>().getSinglePlace(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PlaceBloc, PlaceState>(
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: state.place.photo,
                  height: 300.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 300.h,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 300.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/sign_in_bg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 15.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.place.name,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        state.place.shortDescription,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://www.mountain-forecast.com/locationmaps/Greater-Chimgan.8.gif',
                          height: 200.h,
                          width: double.infinity,
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
                                image:
                                    AssetImage('assets/images/sign_in_bg.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Visitor information',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hours',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.iconColor,
                                ),
                              ),
                              Text(
                                '9AM - 5PM',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Admission',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.iconColor,
                                ),
                              ),
                              Text(
                                '${15} Adults, ${10} Children',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Divider(
                        height: 5.h,
                        thickness: 0.5,
                        color: AppColors.iconColor,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.iconColor,
                            ),
                          ),
                          Text(
                            '+998911234567',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
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
                          CircleAvatar(
                            child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkrtQBXGauSHMKNR-H7uIGq5k7Par8k4scPw&s'),
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
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.iconColor),
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
                        'Absolutely stunning! The castle is well-preserved, and the views are incredible. A must-visit for history buffs and anyone who appreciates beautiful architecture.',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
