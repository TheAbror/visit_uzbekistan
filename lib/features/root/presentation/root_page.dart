import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

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
  bool _hasShownInitialConnectionMessage = false;

  @override
  void initState() {
    super.initState();
    internetConnectionChecker();

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
        } else {
          context.read<RootBloc>().isConnectedToInternet(false);
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
    return BlocConsumer<RootBloc, RootState>(
      listenWhen: (previous, current) =>
          previous.isConnectedToInternet != current.isConnectedToInternet,
      listener: (context, state) {
        // Skip the very first change (usually the initialization)
        if (!_hasShownInitialConnectionMessage) {
          _hasShownInitialConnectionMessage = true;
          return;
        }

        if (!state.isConnectedToInternet) {
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
        if (state.blocProgress == BlocProgress.IS_LOADING) {
          return Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          backgroundColor: AppColors.rootBgColor,
          body: !state.isConnectedToInternet
              ? DownloadsBody()
              : IndexedStack(
                  index: state.tabIndex,
                  children: [
                    HomeTab(),
                    CitiesTab(),
                    PlansTab(),
                    MoreTab(),
                  ],
                ),
          extendBody: true,
          bottomNavigationBar: !state.isConnectedToInternet
              ? SizedBox()
              : RootPageBottomAppBar(tabIndex: state.tabIndex),
        );
      },
    );
  }
}
