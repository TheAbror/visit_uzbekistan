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
              Image.network(
                state.restaurant.photo,
                fit: BoxFit.cover,
              ),
              Text(state.restaurant.name),
              Text(state.restaurant.location),
              SizedBox(height: 10.h),
              Text(state.restaurant.shortDescription),
              Text(state.restaurant.info),
            ],
          );
        },
      ),
    );
  }
}
