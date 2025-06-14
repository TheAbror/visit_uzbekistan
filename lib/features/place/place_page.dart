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

          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
                child: CachedNetworkImage(
                  imageUrl: state.place.photo,
                  height: 300.h,
                  width: double.infinity,
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
              ),
              Text(state.place.name),
              Text(state.place.location),
              SizedBox(height: 10.h),
              Text(state.place.shortDescription),
              Text(state.place.info),
              Row(
                children: [
                  Text(
                    'City name: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(state.place.cityName ?? ''),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
