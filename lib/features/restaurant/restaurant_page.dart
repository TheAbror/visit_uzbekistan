import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class RestaurentPage extends StatefulWidget {
  final IdandTitle idandTitle;

  const RestaurentPage({
    super.key,
    required this.idandTitle,
  });

  @override
  State<RestaurentPage> createState() => _RestaurentPageState();
}

class _RestaurentPageState extends State<RestaurentPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showHeaderBg = false;

  @override
  void initState() {
    super.initState();
    context.read<RestaurantBloc>().getSingleRestaurant(widget.idandTitle.id);

    _scrollController.addListener(() {
      if (_scrollController.offset > 50 && !_showHeaderBg) {
        setState(() => _showHeaderBg = true);
      } else if (_scrollController.offset <= 50 && _showHeaderBg) {
        setState(() => _showHeaderBg = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: state.restaurant.photo,
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
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.restaurant.name,
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            state.restaurant.shortDescription,
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          Text(
                            state.restaurant.info,
                            style: TextStyle(fontSize: 14.sp),
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
                                    'Address',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.iconColor,
                                    ),
                                  ),
                                  Text(
                                    '123 Main Street, Anytown',
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
                            height: 6.h,
                            thickness: 0.5,
                            color: AppColors.iconColor,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contacts',
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
                          ReviewsAndRatingsWidget(),
                          ActionButton(
                            text: 'Book Now',
                            onPressed: () {},
                          ),
                          SizedBox(height: 40.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Sticky top bar with dynamic background
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 10.h,
                    left: 8.w,
                    right: 8.w,
                    bottom: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: _showHeaderBg
                        ? Colors.white.withOpacity(0.9)
                        : Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SingleCityPageLeadingIcon(),
                      Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          IconsaxPlusLinear.heart,
                          size: 18.sp,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
