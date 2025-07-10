import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late StreamSubscription<InternetConnectionStatus> _connectionListener;
  final InternetConnectionChecker _connectionChecker =
      InternetConnectionChecker.instance;

  @override
  void initState() {
    super.initState();
    context.read<RootBloc>().manageLoader(true);

    internetConnectionChecker();

    allRequests();
  }

  void allRequests() {
    context.read<CitiesTabBloc>().getAllCities(context);
    context.read<HomeBloc>().getAllPlaces(context);
    context.read<HomeBloc>().getAllArticels(context);
    context.read<HomeBloc>().getAllTours(context);
    context.read<HomeBloc>().getAllUsefulApps(context);
  }

  void internetConnectionChecker() {
    _connectionListener = _connectionChecker.onStatusChange.listen(
      (InternetConnectionStatus status) {
        if (status == InternetConnectionStatus.connected) {
          context.read<RootBloc>().isInternetOn(true);
          allRequests();
          context.read<RootBloc>().manageLoader(false);
        } else {
          context.read<RootBloc>().isInternetOn(false);
        }
      },
    );
  }

  @override
  void dispose() {
    _connectionListener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.rootBgColor,
      body: BlocConsumer<RootBloc, RootState>(
        listenWhen: (previous, current) =>
            previous.isInternetOn != current.isInternetOn,
        listener: (context, state) {
          if (!state.isInternetOn) {
            showMessage(
              'No internet connection. Displaying downloaded content until back online.',
              isError: true,
            );

            context.read<RootBloc>().setAttemptedCheck();
          }

          if (state.attemptedToCheck) {
            if (state.isInternetOn) {
              showMessage('Back online');
            }
          }
        },
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return Center(child: CircularProgressIndicator());
          }

          return !state.isInternetOn ? NoInternetMode() : Tabs(state: state);
        },
      ),
      extendBody: true,
      bottomNavigationBar: RootPageBottomAppBar(),
    );
  }
}
