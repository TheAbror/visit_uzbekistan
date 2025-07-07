import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class Tabs extends StatelessWidget {
  final RootState state;

  const Tabs({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: state.tabIndex,
      children: [
        HomeTab(),
        CitiesTab(),
        PlansTab(),
        MoreTab(),
      ],
    );
  }
}
