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
  Hive.registerAdapter(UserModelAdapter());

  savedCitiesBox = await Hive.openBox<LocalStorageForCities>(
      ShPrefKeys.localStorageSavedCity);
  hiveBox = await Hive.openBox<LocalStorage>(ShPrefKeys.localStorageItems);
  userBox = await Hive.openBox<UserModel>(ShPrefKeys.userBox);

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

//TODO add things to do 

// https://www.booking.com/attractions/searchresults/uz/urganch.html?end_date=2025-08-17&filter_by_min_rating[]=0.0&selected_currency=USD&etStateBlob=EpfzfImYbs3Oq1sNLWqQigYMqaA4_GxYj1xWD1AvjDUQkn8YuDOsWxMLCXrEHav9qqRTNzSPVqmi3-kr4BfbPeg&adplat=www-ACCOMMODATION_SEARCH_RESULTS-IN_FEED_ATTRACTION_BANNER-attraction-missing_creative-2761xxdb8asGtYoLc0U8e2&label=New_Russian_RU_UZ_26761452505-qgdfSLOdsElQF7hwvy0jGAS217244927670%3Apl%3Ata%3Ap1%3Ap2%3Aac%3Aap%3Aneg%3Afi%3Atidsa-64415538505%3Alp9075974%3Ali%3Adec%3Adm&distribution_id=2761xxdb8asGtYoLc0U8e2&aid=318615&client_name=exposure&start_date=2025-08-13










