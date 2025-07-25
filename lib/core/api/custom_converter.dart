// ignore_for_file: type_literal_in_constant_pattern
import 'package:chopper/chopper.dart';
import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class CustomDataConverter extends JsonConverter {
  @override
  Future<Response<BodyType>> convertResponse<BodyType, InnerType>(
      Response response) async {
    final Response<dynamic> dynamicResponse =
        await super.convertResponse(response);

    var body = dynamicResponse.body;

    final BodyType customBody =
        convertToCustomObject<BodyType, InnerType>(body);

    return dynamicResponse.copyWith<BodyType>(
      body: customBody,
    );
  }
}

BodyType convertToCustomObject<BodyType, SingleItemType>(dynamic element) {
  if (element is List) {
    return deserializeListOf<BodyType, SingleItemType>(element);
  } else {
    return deserialize<SingleItemType>(element);
  }
}

dynamic deserializeListOf<BodyType, SingleItemType>(
  List dynamicList,
) {
  List<SingleItemType> list = dynamicList
      .map<SingleItemType>((element) => deserialize<SingleItemType>(element))
      .toList();
  return list;
}

dynamic deserialize<SingleItemType>(Map<String, dynamic> json) {
  switch (SingleItemType) {
    case int:
      return int;

    case CitiesResponse:
      return CitiesResponse.fromJson(json);

    case PlacesResponse:
      return PlacesResponse.fromJson(json);

    case SingleCityResponse:
      return SingleCityResponse.fromJson(json);

    case ArticlesResponse:
      return ArticlesResponse.fromJson(json);

    case SingleItemResponse:
      return SingleItemResponse.fromJson(json);

    case ToursResponse:
      return ToursResponse.fromJson(json);

    case UsefulAppResponse:
      return UsefulAppResponse.fromJson(json);

    case LogInRequest:
      return LogInRequest.fromJson(json);

    case LogInResponse:
      return LogInResponse.fromJson(json);

    case MobileResponse:
      return MobileResponse.fromJson(json);

    case ReviewRequest:
      return ReviewRequest.fromJson(json);

    case ReviewsResponse:
      return ReviewsResponse.fromJson(json);

    case LogoutResponse:
      return LogoutResponse.fromJson(json);

    default:
      return null;
  }
}
