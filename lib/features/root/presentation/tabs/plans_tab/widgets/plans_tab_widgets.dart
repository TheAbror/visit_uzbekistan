import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

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
              errorBuilder: (context, error, stackTrace) {
                return Text('error');
              },
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
                arguments: IdandTitle(id: id, title: text),
              );
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 6.h,
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
                  context.localizations.taxRefund,
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
