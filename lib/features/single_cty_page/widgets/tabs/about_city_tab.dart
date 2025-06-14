import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class AboutCityTab extends StatelessWidget {
  const AboutCityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.only(bottom: 40.h),
          children: [
            HtmlWidget(state.response.info),
          ],
        );
      },
    );
  }
}
