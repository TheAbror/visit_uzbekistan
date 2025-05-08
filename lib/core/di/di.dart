// import 'package:visit_uzbekistan/widget_imports.dart';

// final sl = GetIt.instance;

// Future<void> setUpDependencyInjector() async {
//   // Timetable Service from ApiProvider
//   sl.registerLazySingleton<ScannerService>(() => ApiProvider.scannerService);

//   // Repository
//   sl.registerLazySingleton<ScannerRepository>(
//     () => ScannerRepositoryImpl(sl<ScannerService>()),
//   );

//   // UseCases
//   sl.registerFactory(() => PostQRScannerResultUseCase(sl()));

//   // BLoC
//   sl.registerFactory(
//     () => ScannerBloc(
//       postQRScannerResultUseCase: sl(),
//     ),
//   );
// }


/// [Documentation]

// 🧱 Why Domain, Data, Repositories (Clean Architecture)?
// 1. Separation of Concerns
// UI Layer shows data and handles user interaction (Widgets, Blocs).

// Domain Layer holds business logic (UseCases, Entities).

// Data Layer handles how and where data comes from (API, DB, Models, Services etc.).

// 💡 Each part has one job → easier to understand, test, and maintain.



// lib/
// ├── domain/
// │   ├── entities/
// │   ├── usecases/
// │   └── repositories/
// ├── data/
// │   ├── models/
// │   ├── services/
// │   └── repositories/
// ├── presentation/
// │   ├── bloc/
// │   └── screens/
// └── core/
//     ├── error/
//     ├── utils/
//     └── constants/
