import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;
import 'package:visit_uzbekistan/features/root/domain/services/home_services.dart';
import 'package:visit_uzbekistan/widget_imports.dart';

class ApiProvider {
  static NotAuthorizedInterceptor notAuthorizedInterceptor =
      NotAuthorizedInterceptor();

  static late ChopperClient _client;
  static late HomeServices homeServices;

  ///Services
  static create({String? token, int? institutionID, String? language}) {
    _client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 40),
      ),
      services: [
        HomeServices.create(),
      ],
      interceptors: getInterceptors(
        token: token,
        institutionID: institutionID,
        language: language,
      ),
      converter: CustomDataConverter(),
    );

    homeServices = _client.getService<HomeServices>();
  }

  static List getInterceptors({
    String? token,
    int? institutionID,
    String? language,
  }) {
    final userLang = PreferencesServices.getLangCode();
    final savedInstitutionID = PreferencesServices.getInstitutionId() ?? 1;

    List interceptors = [];

    interceptors.add(HttpLoggingInterceptor());
    interceptors.add(notAuthorizedInterceptor);

    interceptors.add(
      HeadersInterceptor(
        {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: token != null ? 'Bearer $token' : '',
          'Institution': institutionID != null
              ? institutionID.toString()
              : savedInstitutionID.toString(),
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
