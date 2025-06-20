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
  final ScrollController _scrollController = ScrollController();
  bool _showHeaderBg = false;

  @override
  void initState() {
    super.initState();
    context.read<PlaceBloc>().getSinglePlace(widget.id);

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
      body: BlocBuilder<PlaceBloc, PlaceState>(
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
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
                    SinglePlaceDetails(state: state),
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

class SinglePlaceDetails extends StatelessWidget {
  final PlaceState state;

  const SinglePlaceDetails({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    image: AssetImage('assets/images/sign_in_bg.jpg'),
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
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
