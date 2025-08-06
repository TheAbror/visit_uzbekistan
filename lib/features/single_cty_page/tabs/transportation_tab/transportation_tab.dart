import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class TransportationTab extends StatelessWidget {
  const TransportationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        if (state.response.carRentals.isEmpty) {
          return Padding(
            padding: EdgeInsets.only(bottom: 50.h),
            child: Center(
              child: Text('No cars found'),
            ),
          );
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.h,
            crossAxisSpacing: 8.h,
            childAspectRatio: 0.85,
          ),
          itemCount: state.response.carRentals.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final singleItem = state.response.carRentals[index];

            final newModel = SingleItemResponse(
              id: singleItem.id,
              name: singleItem.name,
              location: singleItem.location,
              info: singleItem.info,
              photo: singleItem.photo,
              shortDescription: singleItem.shortDescription,
              createdAt: singleItem.createdAt,
              updatedAt: singleItem.updatedAt,
              isImageTiny: true,
              type: singleItem.type,
            );

            return GridViewItem(
              item: newModel,
              moreID: state.response.id,
            );
          },
        );
      },
    );
  }
}

class TitleAndDivider extends StatelessWidget {
  final String title;
  final bool? isDividerNeeded;

  const TitleAndDivider({
    super.key,
    required this.title,
    this.isDividerNeeded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 2.h),
        if (isDividerNeeded == true)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Divider(height: 0.5.h, thickness: 0.5),
          ),
        SizedBox(height: 2.h),
        Padding(
          padding: EdgeInsets.only(bottom: 4.h),
          child: Text(
            title,
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}

class TransportationItem extends StatelessWidget {
  final String image;
  final String model;
  final String carClass;
  final int price;

  const TransportationItem({
    super.key,
    required this.image,
    required this.model,
    required this.carClass,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final _height = 80;
    final _width = 80;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.transportPage,
          arguments: 0,
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 4.h),
        padding: EdgeInsets.only(
          left: 8.w,
          right: 8.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.rootBgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Image.network(
              height: _height.w,
              width: _width.w,
              image,
              errorBuilder: (
                BuildContext context,
                Object exception,
                StackTrace? stackTrace,
              ) {
                return Container(
                  height: _height.h,
                  width: _width.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/sign_in_bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              //loader case
              loadingBuilder: (
                BuildContext context,
                Widget child,
                ImageChunkEvent? loadingProgress,
              ) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  height: _height.h,
                  width: _width.w,
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
            ),
            SizedBox(width: 2.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Model: ${model}'),
                Text('Class: ${carClass}'),
                Text('Price: \$${price}'),
              ],
            ),
            Spacer(),
            Icon(IconsaxPlusLinear.arrow_right_3),
          ],
        ),
      ),
    );
  }
}

class NoDataAvailableYetWillAddSoon extends StatelessWidget {
  final String title;

  const NoDataAvailableYetWillAddSoon({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
