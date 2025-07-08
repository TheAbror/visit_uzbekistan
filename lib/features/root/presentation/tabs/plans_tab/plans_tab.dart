import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class PlansTab extends StatelessWidget {
  const PlansTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabsAppBar(text: context.localizations.plans),
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
              // Text('''
              //   Transportation options
              //   ✅ Train tickets
              //   ✅ Airport tickets

              //   ✅ Currency exchange tips

              //   Safety & cultural do’s and don’ts

              //   ✅ Tax refund info

              //   Travel tips & must-know essentials

              //   '''),
              SizedBox(height: 60.h),
            ],
          ),
        ),
      ],
    );
  }
}
