import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    super.initState();

    context.read<CitiesTabBloc>().getAllCities(context);
    context.read<HomeBloc>().getAllPlaces(context);
    context.read<HomeBloc>().getAllArticels(context);
    context.read<HomeBloc>().getAllTours(context);
    context.read<HomeBloc>().getAllUsefulApps(context);
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
              CitiesTab(),
              PlansTab(),
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
