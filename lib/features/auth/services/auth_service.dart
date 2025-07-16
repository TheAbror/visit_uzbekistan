import 'package:chopper/chopper.dart';
import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'auth_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient? client]) =>
      _$AuthService(client ?? ChopperClient());

  @Post(path: AppStrings.login)
  Future<Response<LogInResponse>> logIn(@Body() LogInRequest body);

  @Post(path: AppStrings.register)
  Future<Response<LogInResponse>> register(@Body() RegisterRequest body);

  @Post(path: AppStrings.logout)
  Future<Response<LogoutResponse>> logout();
}
