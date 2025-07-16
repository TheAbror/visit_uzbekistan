import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;
import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class ApiProvider {
  static NotAuthorizedInterceptor notAuthorizedInterceptor =
      NotAuthorizedInterceptor();

  static late ChopperClient _client;
  static late HomeServices homeServices;
  static late AuthService authServices;
  static late ReviewService reviewService;

  ///Services
  static create({String? token, String? language}) {
    _client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 5),
      ),
      services: [
        HomeServices.create(),
        AuthService.create(),
        ReviewService.create(),
      ],
      interceptors: getInterceptors(
        token: token,
        language: language,
      ),
      converter: CustomDataConverter(),
    );

    homeServices = _client.getService<HomeServices>();
    authServices = _client.getService<AuthService>();
    reviewService = _client.getService<ReviewService>();
  }

  static List getInterceptors({
    String? token,
    String? language,
  }) {
    final userLang = PreferencesServices.getLangCode();

    List interceptors = [];

    interceptors.add(HttpLoggingInterceptor());
    interceptors.add(notAuthorizedInterceptor);

    interceptors.add(
      HeadersInterceptor(
        {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer 8|NgNHP4RPmzuIRRPFIwjftH51D8N9cA5MlwlpRjlY89011d96',
          // HttpHeaders.authorizationHeader: token != null ? 'Bearer $token' : '',
          'Accept-Language': userLang ?? 'en'
        },
      ),
    );

    return interceptors;
  }

  static dispose() {
    _client.dispose();
  }
}
