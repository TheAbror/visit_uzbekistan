import 'package:visit_uzbekistan/widget_imports.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          TitleAndViewAllWidget(
            title: 'Cities',
            onTap: () {},
          ),
          HomeTabItems(),
          TitleAndViewAllWidget(
            title: 'Articles',
            onTap: () {},
          ),
          HomeTabItems(),
          TitleAndViewAllWidget(
            title: 'Some dummy text',
            onTap: () {},
          ),
          HomeTabItems(),
        ],
      ),
    );
  }
}
