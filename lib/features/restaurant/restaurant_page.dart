import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class RestaurentPage extends StatefulWidget {
  final int id;

  const RestaurentPage({
    super.key,
    required this.id,
  });

  @override
  State<RestaurentPage> createState() => _RestaurentPageState();
}

class _RestaurentPageState extends State<RestaurentPage> {
  @override
  void initState() {
    super.initState();

    context.read<RestaurantBloc>().getSingleRestaurant(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
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
              SizedBox(height: 2.h),
              Text(
                state.restaurant.name,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2.h),
              Text(
                state.restaurant.location,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
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
              SizedBox(height: 40.h),
            ],
          );
        },
      ),
    );
  }
}
