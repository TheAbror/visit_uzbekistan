import 'package:visit_uzbekistan/features/single_cty_page/widgets/title_desc_reviews.dart';
import 'package:visit_uzbekistan/widget_imports.dart';

// const SliverToBoxAdapter(
//   child: SizedBox(
//     height: 20,
//     child: Center(
//         child: Text('Scroll to see the SliverAppBar in effect.')),
//   ),
// ),

// title: Text(
//   'Samarkand',
//   style: TextStyle(color: AppColors.float),
// ),
// centerTitle: false,

class SignleCityPage extends StatelessWidget {
  final int cityID;

  const SignleCityPage({
    super.key,
    required this.cityID,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 200.h,
            leading: SingleCityPageLeadingIcon(),
            actions: [SingleCityPageMakeFavoriteWidget()],
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              expandedTitleScale: 1.8,
              background: SingleCityPageBgImage(),
            ),
          ),
          SliverFillRemaining(
            child: Stack(
              children: [NewBody()],
            ),
          ),
        ],
      ),
    );
  }
}

class NewBody extends StatelessWidget {
  const NewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: AppColors.float,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleDescReviews(),
            Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                bottom: 16.h,
              ),
              child: Text(
                'item.shortDescription',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.miscellaneousTabUnselected,
                ),
              ),
            ),
            SingleCityPageTabBar(),
            SizedBox(height: 8),
            Divider(height: 0.5, thickness: 0.5),
            SizedBox(height: 16),
            SingleCityPageTabBarView(),
          ],
        ),
      ),
    );
  }
}
