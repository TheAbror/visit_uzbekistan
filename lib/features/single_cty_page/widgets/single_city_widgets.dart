import 'package:visit_uzbekistan/widget_imports.dart';

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

class SingleCityPageBgImage extends StatelessWidget {
  const SingleCityPageBgImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        if (state.blocProgress == BlocProgress.IS_LOADING) {
          return Center(child: CircularProgressIndicator());
        }

        return Image.network(
          state.response.photo,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.topCenter,
          loadingBuilder: (
            BuildContext context,
            Widget child,
            ImageChunkEvent? loadingProgress,
          ) {
            if (loadingProgress == null) return child;
            return SizedBox(
              height: 200.h,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
          },
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
            'assets/icons/single_city/arrow-left.svg'),
      ),
      onPressed: () => Navigator.pop(context),
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
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            // context.read<RootBloc>().addFavorite(item);
          },
          child: Container(
            padding: EdgeInsets.all(4.w),
            margin: EdgeInsets.only(right: 8.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              // state.favorites.contains(
              //         state.favorites.firstWhere((e) => e.id == cityID))
              //     ? IconsaxPlusBold.heart
              //     :
              IconsaxPlusLinear.heart,
              size: 18.sp,
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
