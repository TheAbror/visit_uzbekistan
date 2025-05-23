import 'package:visit_uzbekistan/widget_imports.dart';

class SignleCityPage extends StatelessWidget {
  final int cityID;

  const SignleCityPage({
    super.key,
    required this.cityID,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.float,
      body: DefaultTabController(
        length: 8,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 200.h,
              // title: Text(
              //   'Samarkand',
              //   style: TextStyle(color: AppColors.float),
              // ),
              // centerTitle: false,
              leading: SingleCityPageLeadingIcon(),
              actions: [SingleCityPageMakeFavoriteWidget(cityID: cityID)],
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [StretchMode.zoomBackground],
                expandedTitleScale: 1.8,
                background: SingleCityPageBgImage(),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              // floating: false,
              delegate: _HeaderDelegate(),
            ),
            SliverFillRemaining(child: SingleCityPageTabBarView()),
          ],
        ),
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.float,
      padding: EdgeInsets.only(top: 6.h),
      child: Column(
        children: [
          SingleCityPageTabBar(),
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
