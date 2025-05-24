import 'package:visit_uzbekistan/features/root/presentation/tabs/search_tab/search_tab.dart';
import 'package:visit_uzbekistan/widget_imports.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    super.initState();

    context.read<HomeBloc>().getAllCities(context);
    context.read<HomeBloc>().getAllPlaces(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.rootBgColor,
          body: IndexedStack(
            index: state.tabIndex,
            children: [
              HomeTab(),
              SearchTab(),
              ProfileTab(),
              MoreTab(),
            ],
          ),
          extendBody: true,
          bottomNavigationBar: RootPageBottomAppBar(tabIndex: state.tabIndex),
        );
      },
    );
  }
}
