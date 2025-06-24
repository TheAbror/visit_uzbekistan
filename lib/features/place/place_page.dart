import 'package:visit_uzbekistan/features/place/place_details.dart';
import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class PlacePage extends StatefulWidget {
  final IdandTitle idandTitle;

  const PlacePage({
    super.key,
    required this.idandTitle,
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
    context.read<PlaceBloc>().getSinglePlace(widget.idandTitle.id);

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
