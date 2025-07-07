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
          context.read<RootBloc>().isConnectedToInternet(true);
          context.read<RootBloc>().attemptedToCheckConnection(true);
          allRequests();
        } else {
          context.read<RootBloc>().isConnectedToInternet(false);
          context.read<RootBloc>().attemptedToCheckConnection(true);
        }
      },
    );
  }

  @override
  void dispose() {
    _connectionListener.cancel();
    _connectionChecker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.rootBgColor,
      body: BlocConsumer<RootBloc, RootState>(
        // listenWhen: (previous, current) =>
        //     previous.isConnectedToInternet != current.isConnectedToInternet,
        listener: (context, state) {
          // Skip showing toast messages UNTIL the connection has been checked
          // if (!state.hasInternetConnectionBeenChecked) {
          //   return;
          // }

          if (!state.isConnectedToInternet ||
              (!state.isConnectedToInternet &&
                  state.hasInternetConnectionBeenChecked)) {
            showMessage(
              'No internet connection. Displaying downloaded content until back online.',
              isError: true,
            );
          }
          if (state.isConnectedToInternet) {
            showMessage('Back online');
          }
        },
        builder: (context, state) {
          if (!state.hasInternetConnectionBeenChecked &&
              !state.isConnectedToInternet) {
            return Center(child: CircularProgressIndicator());
          }

          return !state.isConnectedToInternet
              ? NoInternetMode()
              : Tabs(state: state);
        },
      ),
      extendBody: true,
      bottomNavigationBar: RootPageBottomAppBar(),
    );
  }
}
