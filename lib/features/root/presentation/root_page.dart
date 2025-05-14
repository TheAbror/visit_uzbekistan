import 'package:visit_uzbekistan/widget_imports.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0XFFEEF2F6),
          body: IndexedStack(
            index: state.tabIndex,
            children: [
              HomeTab(),
              SizedBox(),
              SizedBox(),
              ProfileTab(),
            ],
          ),
          extendBody: true,
          bottomNavigationBar: RootPageBottomAppBar(
            tabIndex: state.tabIndex,
          ),
        );
      },
    );
  }
}

class RootPageBottomAppBar extends StatelessWidget {
  final int tabIndex;

  const RootPageBottomAppBar({
    super.key,
    required this.tabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 56.h,
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: 48.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                size: 26.h,
                color: tabIndex == 0 ? AppColors.primary : Colors.grey,
              ),
              onPressed: () {
                context.read<RootBloc>().changeTab(0);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                size: 26.h,
                color: tabIndex == 1 ? AppColors.primary : Colors.grey,
              ),
              onPressed: () {
                context.read<RootBloc>().changeTab(1);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.travel_explore,
                size: 26.h,
                color: tabIndex == 2 ? AppColors.primary : Colors.grey,
              ),
              onPressed: () {
                context.read<RootBloc>().changeTab(2);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                size: 26.h,
                color: tabIndex == 3 ? AppColors.primary : Colors.grey,
              ),
              onPressed: () {
                context.read<RootBloc>().changeTab(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          TitleAndViewAllWidget(
            title: 'Cities',
            onTap: () {},
          ),
          HomeTabItems(),
          TitleAndViewAllWidget(
            title: 'Articles',
            onTap: () {},
          ),
          HomeTabItems(),
          TitleAndViewAllWidget(
            title: 'Articles',
            onTap: () {},
          ),
          HomeTabItems(),
        ],
      ),
    );
  }
}

class HomeTabItems extends StatelessWidget {
  const HomeTabItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 6,
        padding: EdgeInsets.only(left: 8.w),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.singleCityPage);
            },
            child: Container(
              margin: EdgeInsets.only(right: 8.w),
              height: 180.h,
              width: 280.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.network(
                            'https://dynamic-media.tacdn.com/media/photo-o/2f/61/65/1f/caption.jpg?w=800&h=600&s=1'),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 4.w, top: 4.h),
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: AppColors.float,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.favorite_border_rounded,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text('Lorem ipsum'),
                  SizedBox(height: 4.h),
                  Flexible(
                    child:
                        Text('Lorem ipsum ipsum ipsum ipsum ipsum ipsum ipsum'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TitleAndViewAllWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const TitleAndViewAllWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
        bottom: 10.h,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColors.secondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'View all',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
