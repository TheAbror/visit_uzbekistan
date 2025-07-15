import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreferencesServices.init();
  await Hive.initFlutter();

  Hive.registerAdapter(LocalStorageAdapter());
  Hive.registerAdapter(LocalStorageForCitiesAdapter());
  Hive.registerAdapter(SingleItemModelAdapter());
  Hive.registerAdapter(SingleCityModelAdapter());
  Hive.registerAdapter(ListOfImagesModelAdapter());

  savedCitiesBox = await Hive.openBox<LocalStorageForCities>(
      ShPrefKeys.localStorageSavedCity);
  hiveBox = await Hive.openBox<LocalStorage>(ShPrefKeys.localStorageItems);

  ApiProvider.create();

  setUpLogging();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => RootBloc()),
            BlocProvider(create: (context) => HomeBloc()),
            BlocProvider(create: (context) => AuthBloc()),
            BlocProvider(create: (context) => CitiesTabBloc()),
            BlocProvider(
                create: (context) => LocalizationBloc()..initLocalization()),
          ],
          child: const MyApp(),
        ),
      );
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _deviceLanguage = Platform.localeName.splitLangCodeFromLocale();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(360, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            onGenerateRoute: MainRouteGenerator().generateRoute,
            locale: Locale(state.languageCode ?? _deviceLanguage),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          ),
        );
      },
    );
  }
}

// 🌍 Competitor Apps & Their Strengths
// Triposo
// Guides by Lonely Planet
// SmartGuide / izi.TRAVEL / PocketGuide

//TODO 
//✅  make article or place, apps downloadable  - DONE 
//✅  make whole city downloadable
//✅  make ui update when working with hive for downloads page - - DONE 
//✅  useful apps with backend - DONE 
//✅  show Single city content from hive when there is no internet
//✅  apply internet connection checker
//✅  refactor plans tab
//✅  in downloads page show both boxes conternt - DONE 
//⛔️  search competitors
//✅  default of rootpage when not loading - showing downloads in init
//✅  make downloads body look good in init
//✅ fixed first time launch when no internet + same case when internet returns - next - fix loader in init
//✅ make city be downloadable only once - no repetitions
//✅ make downladed city`s download icon - bold
//✅ profile page
//✅ useful apps page loader
//✅ articles loader issue
//⛔️ save favorites 
//⛔️ add reviews page 
//⛔️ add adding comment page 
//✅ make places, tours, transport, restaurants get data from box when no internet
//⛔️ plans add route trip from tashkent to xiva













