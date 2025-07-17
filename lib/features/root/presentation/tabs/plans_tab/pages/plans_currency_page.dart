import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class PlansCurrencyPage extends StatefulWidget {
  const PlansCurrencyPage({super.key});

  @override
  State<PlansCurrencyPage> createState() => _PlansCurrencyPageState();
}

class _PlansCurrencyPageState extends State<PlansCurrencyPage> {
  final value = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlansBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Currency exchange rates'),
          leading: SingleCityPageLeadingIcon(),
        ),
        body: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: AppColors.float,
            // borderRadius: BorderRadius.circular(12.r),
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
                            '12720',
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
                            '14925',
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
                          BlocBuilder<PlansBloc, PlansState>(
                            builder: (context, state) {
                              return Expanded(
                                child: TextField(
                                  controller: state.value == 0
                                      ? value
                                      : TextEditingController(
                                          text: state.value.toString(),
                                        ),
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
                              );
                            },
                          ),
                          SizedBox(width: 16.w),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<PlansBloc>()
                                  .calculator(int.parse(value.text));
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
        ),
      ),
    );
  }
}
