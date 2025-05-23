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

//TODO use planes photo for bgImage
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
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(color: AppColors.float),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleDescReviews(
              title: 'Samarkand',
              reviews: '32 Reviews',
            ),
            SingleCityPageShortDesc(
              shortDesc:
                  '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries ''',
            ),
            SingleCityPageTabBar(),
            SizedBox(height: 8.h),
            Divider(height: 0.5.h, thickness: 0.5),
            SingleCityPageTabBarView(),
          ],
        ),
      ),
    );
  }
}
