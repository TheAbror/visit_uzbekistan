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
//1. make article or place downloadable  - DONE
//2. make whole city downloadable
//3. make ui update when working with hive for downloads page - - DONE
// Option 3: Use ValueListenableBuilder (recommended for Hive)
// Hive boxes are ValueListenable, which means you can listen to changes automatically and rebuild UI reactively:

// dart
// Copy
// Edit
// ValueListenableBuilder(
//   valueListenable: hiveBox.listenable(),
//   builder: (context, Box box, _) {
//     final LocalStorage? data = box.get(ShPrefKeys.localStorageItems);
//     final items = data?.localStorageItems ?? [];

//     if (items.isEmpty) {
//       return Center(child: Text("No saved items"));
//     }

//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         final item = items[index];
//         return ListTile(title: Text(item.name));
//       },
//     );
//   },
// );
// Then, when you delete:

// dart
// Copy
// Edit
// await hiveBox.delete(ShPrefKeys.localStorageItems);


//4. useful apps with backend - DONE



