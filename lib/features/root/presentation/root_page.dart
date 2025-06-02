import 'package:visit_uzbekistan/features/root/presentation/tabs/cities_tab/cities_tab.dart';
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

    context.read<CitiesBloc>().getAllCities(context);
    context.read<HomeBloc>().getAllPlaces(context);
    context.read<HomeBloc>().getAllArticels(context);
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
              // ProfileTab(),
              SafeArea(
                child: Column(
                  children: [
                    Text('''
              Plan (instead of Profile)
              
              Help travelers plan ahead for their trip.
              
              Sections:
              
              Create or manage an itinerary
              
              Currency exchange tips
              
              Safety & cultural do’s and don’ts
              
              Tax refund info
              
              Travel tips & must-know essentials
              
              '''),
                  ],
                ),
              ),
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
