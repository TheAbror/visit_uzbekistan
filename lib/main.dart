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



//TODO 
//1.✅  make article or place, apps downloadable  - DONE 
//2.✅  make whole city downloadable
//3.✅  make ui update when working with hive for downloads page - - DONE 
//4.✅  useful apps with backend - DONE 
//5.⛔️  show Single city content from hive when there is no internet
//6.✅  apply internet connection checker
//7.✅  refactor plans tab
//8.✅  in downloads page show both boxes conternt - DONE 
//9.⛔️  search competitors
//10✅  default of rootpage when not loading - showing downloads in init
//11⛔️  make downloads body look good in init






// 🌍 Competitor Apps & Their Strengths
// Triposo
// A global city guide app sourcing data from Wikivoyage, Wikipedia, and user contributions. Offers offline maps, curated attractions, restaurants, and context for thousands of destinations 
// architecturaldigest.com
// +6
// cruiseable.com
// +6
// blog.smart-guide.org
// +6
// reddit.com
// .

// Guides by Lonely Planet
// Provides in-depth destination guides for over 8,000 cities, with expertly curated articles, maps, phrasebooks, and itineraries 
// softwarehouse.au
// .

// Spotted by Locals
// Local-authored city guides in 80+ cities, focusing on authentic recommendations—hidden gems, eateries, cultural spots—written by residents .

// SmartGuide / izi.TRAVEL / PocketGuide
// Specialized in audio walking tours, they offer offline GPS-triggered narration and curated walking routes for both historic and cultural experiences 
// narratemytrip.com
// .