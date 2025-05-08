import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:visit_uzbekistan/widget_imports.dart';

class NotAuthorizedInterceptor implements ResponseInterceptor {
  final StreamController<bool> controller = StreamController<bool>.broadcast();

  @override
  FutureOr<Response> onResponse(Response response) {
    CurrentUser? currentUser = boxCurrentUser.get(ShPrefKeys.currentUser);
    final token = currentUser?.token;

    if (token != null && token.isNotEmpty) {
      if (response.statusCode == 401) {
        controller.add(true);
      }
    }

    return response;
  }
}
