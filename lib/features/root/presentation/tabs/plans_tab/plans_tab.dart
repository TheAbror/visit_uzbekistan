import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

//TODO

class PlansTab extends StatelessWidget {
  const PlansTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90.h,
          color: AppColors.float,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Text(
                'Plans',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.siginTextColor,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
            children: [
              CurrencyExchangeCalculator(),
              SizedBox(height: 10.h),
              TaxRefundInfo(),
              SizedBox(height: 10.h),
              TransportationOptions(),
              SizedBox(height: 10.h),
              Text('''
                Transportation options
                ✅ Train tickets 
                ✅ Airport tickets
                
                ✅ Currency exchange tips
                
                Safety & cultural do’s and don’ts
                
                ✅ Tax refund info
                
                Travel tips & must-know essentials
                
                '''),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ],
    );
  }
}

class TransportationOptions extends StatelessWidget {
  const TransportationOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.float,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tansportation options',
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColors.secondary,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 5.h),
          Text(
            'Air',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h),
          TransportationOption(
            id: 5,
            text: 'Uzbekistan Airways',
            icon:
                'https://play-lh.googleusercontent.com/PEYeJu-CAK-V-3QHC3l7Lqwzwe7xPyRV-5PBqBgBmfL4fiUI0yQGcOklv2fMQGzo3w=w480-h960-rw',
          ),
          TransportationOption(
            id: 6,
            text: 'Silkavia',
            icon:
                'https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/fe/fd/f5/fefdf5f0-7e4b-5f70-7325-409d55c5fb94/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/460x0w.webp',
          ),
          SizedBox(height: 4.h),
          Text(
            'Train',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h),
          TransportationOption(
            id: 4,
            text: 'Uzrailways',
            icon:
                'https://play-lh.googleusercontent.com/Tt2MVvVqNqUc5ytsZv7D0pyvBnzTuEmlbt8KFvxOt5PFRHVzKyaIRU1SPlH8hRswTqs=w480-h960-rw',
          ),
        ],
      ),
    );
  }
}

class TransportationOption extends StatelessWidget {
  final int id;
  final String icon;
  final String text;

  const TransportationOption({
    super.key,
    required this.id,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        color: AppColors.usefulAppsBgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            child: Image.network(
              icon,
              height: 40.w,
              width: 40.w,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.usefullAppsPage,
                arguments: id,
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 6.w,
                vertical: 4.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.siginTextColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Open',
                style: TextStyle(
                  color: AppColors.float,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TaxRefundInfo extends StatelessWidget {
  const TaxRefundInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.float,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Tax refund',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 10.w),
              GestureDetector(
                onTap: () => launchURL(
                    'https://www.uzairways.com/en/press-center/news/tax-free-how-tourists-can-get-refund-goods-purchased-uzbekistan'),
                child: Text(
                  'Read more',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(
              '''Foreign nationals can now receive VAT refunds on goods purchased in Uzbekistan through the new  Tax Free  system, available at five international airports:  Tashkent, Samarkand, Bukhara, Fergana , and Urgench . The system applies to approved goods such as  clothing, cosmetics, electronics, carpets, silk, ceramics, and more , with a minimum purchase amount of  1 million UZS . Tourists must register in the  "Soliq" mobile app , scan their receipts, and present their goods, passport, and boarding pass at the  Tax Free desk  before departure. The refund— 90% of the VAT paid —is transferred to the traveler’s international bank card after the  25th of the following month.'''),
        ],
      ),
    );
  }
}

class CurrencyExchangeCalculator extends StatelessWidget {
  const CurrencyExchangeCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.float,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Currency rate',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 10.w),
              GestureDetector(
                onTap: () => launchURL(
                    'https://nbu.uz/en/for-individuals-exchange-rates'),
                child: Text(
                  'Read more',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Container(
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
              color: AppColors.usefulAppsBgColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Currency',
                      style: TextStyle(color: AppColors.darkGrey),
                    ),
                    Text(
                      'Value',
                      style: TextStyle(color: AppColors.darkGrey),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6.h),
                  child: Row(
                    children: [
                      Assets.icons.flags.flagEn.image(),
                      SizedBox(width: 4.w),
                      Text('USD'),
                      Spacer(),
                      Text(
                        '12820',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6.h),
                  child: Row(
                    children: [
                      Assets.icons.flags.flagFr.image(),
                      SizedBox(width: 4.w),
                      Text('EUR'),
                      Spacer(),
                      Text(
                        '14710',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6.h),
                  child: Row(
                    children: [
                      Assets.icons.flags.flagRu.image(),
                      SizedBox(width: 4.w),
                      Text('RUB'),
                      Spacer(),
                      Text(
                        '170',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return const CurrencyCalculator();
                            },
                          );
                        },
                        child: Icon(
                          IconsaxPlusLinear.dollar_circle,
                          color: AppColors.siginTextColor,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Select currency',
                            border: InputBorder.none,
                            isDense: true,
                            hintStyle: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.lightGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      GestureDetector(
                        onTap: () {
                          //
                        },
                        child: Icon(
                          IconsaxPlusLinear.calculator,
                          color: AppColors.siginTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurrencyCalculator extends StatelessWidget {
  const CurrencyCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 8.h,
        bottom: 10.h,
        left: 20.w,
        right: 20.w,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Colors.white,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BottomSheetTopIcon(),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/global.svg',
                  height: 24.h,
                  width: 24.w,
                  colorFilter: ColorFilter.mode(
                    AppColors.textColorDarkBlue,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'Choose currency',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColorDarkBlue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            moreTabOptions(
              'USD',
              const Locale.fromSubtags(
                languageCode: 'en',
                countryCode: 'US',
              ),
              context,
              true,
              svgFlag: Assets.icons.flags.flagEn.image(),
            ),
            moreTabOptions(
              'EUR',
              const Locale.fromSubtags(
                languageCode: 'es',
                countryCode: 'ES',
              ),
              context,
              true,
              svgFlag: Assets.icons.flags.flagSpain.image(),
            ),
            moreTabOptions(
              'RUB',
              const Locale.fromSubtags(
                languageCode: 'ru',
                countryCode: 'RU',
              ),
              context,
              true,
              svgFlag: Assets.icons.flags.flagRu.image(),
            ),
          ],
        ),
      ),
    );
  }
}
