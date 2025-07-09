import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class SignleCityPage extends StatefulWidget {
  final IdandTitle idandTitle;

  const SignleCityPage({
    super.key,
    required this.idandTitle,
  });

  @override
  State<SignleCityPage> createState() => _SignleCityPageState();
}

class _SignleCityPageState extends State<SignleCityPage> {
  @override
  void initState() {
    super.initState();

    final bool _root = context.read<RootBloc>().state.isConnectedToInternet;

    if (_root) {
      context.read<CityBloc>().getSingleCity(widget.idandTitle.id);
    } else {
      context.read<CityBloc>().assignSaveCity(widget.idandTitle.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.float,
      body: DefaultTabController(
        length: 5,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 200.h,
              leading: SingleCityPageLeadingIcon(),
              actions: [
                Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      final isSaved =
                          await context.read<CityBloc>().saveSingleCityToHive();
                      if (isSaved) {
                        showMessage('Saved');
                      }
                    },
                    child: Icon(
                      IconsaxPlusLinear.document_download,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                SingleCityPageMakeFavoriteWidget(cityID: widget.idandTitle.id)
              ],
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [StretchMode.zoomBackground],
                expandedTitleScale: 1.8,
                background: SingleCityPageBgImage(),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: _HeaderDelegate(),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding,
                  right: defaultPadding,
                  top: 10.h,
                ),
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    AboutCityTab(),
                    PlacesTab(),
                    TransportationTab(),
                    ToursTab(),
                    RestaurantsTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.float,
      padding: EdgeInsets.only(top: 6.h),
      child: Column(
        children: [
          BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              return ColoredBox(
                color: AppColors.float,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    labelColor: AppColors.float,
                    unselectedLabelColor: AppColors.foregroundTertiaryRest,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    indicatorPadding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ),
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 1.h,
                    ),
                    indicator: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    tabs: [
                      SingleCityTab(label: 'About ' + state.response.name),
                      SingleCityTab(label: 'Places'),
                      SingleCityTab(label: 'Transportation'),
                      SingleCityTab(label: 'Tours'),
                      SingleCityTab(label: 'Restaurants'),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 8.h),
          Divider(height: 0.5.h, thickness: 0.5),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 46.h;

  @override
  double get minExtent => 46.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

//https://github.com/ivansaul/Flutter-UI-Kit/blob/master/custom_slivers/lib/home_screen.dart
//https://www.youtube.com/shorts/DXopel8Pf50
