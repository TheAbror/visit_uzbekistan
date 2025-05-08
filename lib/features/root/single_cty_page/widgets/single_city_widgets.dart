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
        style: TextStyle(fontSize: 13),
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
