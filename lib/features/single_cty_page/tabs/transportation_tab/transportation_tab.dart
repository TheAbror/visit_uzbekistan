import 'package:visit_uzbekistan/widget_imports.dart';

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

            return GridViewItem(item: singleItem);
          },
        );
      },
    );

    //   BlocBuilder<CityBloc, CityState>(
    //     builder: (context, state) {
    //       return
    //       Listv
    //       // ListView(
    //       //   padding: EdgeInsets.zero,
    //       //   children: [
    //       //     // TitleAndDivider(title: 'Book a driver'),

    //       //     // TransportationItem(
    //       //     //   image:
    //       //     //       'https://bydzone.uz/wp-content/uploads/2024/02/black-02-7-min.png',
    //       //     //   model: 'BYD Champion DM-I Champion',
    //       //     //   carClass: 'Luxury',
    //       //     //   price: 100,
    //       //     // ),
    //       //     // TransportationItem(
    //       //     //   image:
    //       //     //       'https://www.masmotors.ru/resources/models/49/colors/color/14_600x310.webp',
    //       //     //   model: 'BYD Champion DM-I Champion',
    //       //     //   carClass: 'Business',
    //       //     //   price: 40,
    //       //     // ),

    //       //     // ///////

    //       //     // TitleAndDivider(
    //       //     //   title: 'Rentals',
    //       //     //   isDividerNeeded: true,
    //       //     // ),

    //       //     // NoDataAvailableYetWillAddSoon(
    //       //     //     title: 'No rental cars available yet, we will add soon 😃'),

    //       //     // // //

    //       //     // TitleAndDivider(
    //       //     //   title: 'Public transportation',
    //       //     //   isDividerNeeded: true,
    //       //     // ),

    //       //     // NoDataAvailableYetWillAddSoon(
    //       //     //     title:
    //       //     //         'No public transportation data availbale yet, we will add soon 😃'),

    //       //     // TitleAndDivider(
    //       //     //   title: 'Taxi',
    //       //     //   isDividerNeeded: true,
    //       //     // ),

    //       //     // NoDataAvailableYetWillAddSoon(
    //       //     //     title: 'No taxi data availbale yet, we will add soon 😃'),
    //       //   ],
    //       // );
    //     },
    //   );
    // }
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.singleTransportPage,
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
              height: 80.w,
              width: 80.w,
              image,
              //TODO add loader and error
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
