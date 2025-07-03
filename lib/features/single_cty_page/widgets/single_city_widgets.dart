import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class SingleCityTab extends StatelessWidget {
  final String label;

  const SingleCityTab({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 6,
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 12.sp),
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  final String subTitle;

  const SubTitle({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        // color: AppColors.miscellaneousTabUnselected,
      ),
    );
  }
}

class SingleCityTitle extends StatelessWidget {
  final String title;

  const SingleCityTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        // color: AppColors.singleCityTitleColor,
      ),
    );
  }
}

class SingleCityPageBgImage extends StatefulWidget {
  const SingleCityPageBgImage({
    super.key,
  });

  @override
  State<SingleCityPageBgImage> createState() => _SingleCityPageBgImageState();
}

class _SingleCityPageBgImageState extends State<SingleCityPageBgImage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final newIndex = _pageController.page?.round() ?? 0;
      if (newIndex != _currentPage) {
        setState(() {
          _currentPage = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        if (state.blocProgress == BlocProgress.IS_LOADING) {
          return Center(child: CircularProgressIndicator());
        }
        return Stack(
          children: [
            (state.response.images != null &&
                    state.response.images?.isEmpty == true)
                ? CachedNetworkImage(
                    imageUrl: state.response.photo,
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
                  )
                : PageView.builder(
                    controller: _pageController,
                    itemCount: state.response.images?.length,
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        imageUrl: state.response.images![index].path,
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
                      );
                    },
                  ),
            if (state.response.images?.isNotEmpty == true)
              Positioned(
                right: 16,
                bottom: 16,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${_currentPage + 1} / ${state.response.images?.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class SingleCityPageMakeFavoriteWidget extends StatelessWidget {
  final int cityID;

  const SingleCityPageMakeFavoriteWidget({
    super.key,
    required this.cityID,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, cityState) {
        final singleItem = cityState.singleItem;

        return GestureDetector(
          onTap: () {
            context.read<RootBloc>().addFavorite(singleItem, context);
          },
          child: BlocBuilder<RootBloc, RootState>(
            builder: (context, rootState) {
              return Container(
                padding: EdgeInsets.all(4.w),
                margin: EdgeInsets.only(right: 8.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  rootState.favoritesInitial.isEmpty
                      ? IconsaxPlusLinear.heart
                      : rootState.favoritesInitial.any((e) => e.id == cityID)
                          ? IconsaxPlusBold.heart
                          : IconsaxPlusLinear.heart,
                  size: 18.sp,
                  color: Colors.red,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class SingleCityPageLeadingIcon extends StatelessWidget {
  const SingleCityPageLeadingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        height: 26.w,
        width: 26.w,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: SvgPicture.asset(
          height: 24.w,
          width: 24.w,
          'assets/icons/single_city/arrow-left.svg',
        ),
      ),
      onPressed: () => Navigator.pop(context),
    );
  }
}
