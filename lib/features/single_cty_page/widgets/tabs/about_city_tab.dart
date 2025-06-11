import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class AboutCityTab extends StatelessWidget {
  const AboutCityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            // TitleDescReviews(
            //   title: state.response.name,
            //   reviews: '32 Reviews',
            // ),
            // SingleCityPageShortDesc(
            //   shortDesc: state.response.info,
            // ),

            HtmlWidget(state.response.info),
            SizedBox(height: 40.h),
          ],
        );
      },
    );
  }
}
