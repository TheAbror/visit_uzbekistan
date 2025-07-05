import 'package:json_annotation/json_annotation.dart';
import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'home_models.g.dart';

// {
//   "cities": [
//     {
//       "id": 1,
//       "name": "xiva",
//       "short_desc": "asdasd",
//       "info": "asdasdsa\r\nasdasd",
//       "created_at": "2025-05-17T16:48:14.000000Z",
//       "updated_at": "2025-05-17T16:48:14.000000Z"
//     }
//   ]
// }

// {
//   "places": [
//     {
//       "id": 1,
//       "name": "plpp111",
//       "short_desc": "p111",
//       "info": "as dfdklasdnd",
//       "photo": "http://192.168.0.101:8000/storage/uploads/1747507435.jpg",
//       "city_id": 1,
//       "created_at": "2025-05-17T18:43:55.000000Z",
//       "updated_at": "2025-05-17T18:43:55.000000Z"
//     }
//   ]
// }

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class CitiesResponse {
  @JsonKey(defaultValue: [])
  final List<SingleItemResponse> cities;

  CitiesResponse({required this.cities});

  factory CitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$CitiesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CitiesResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class PlacesResponse {
  @JsonKey(defaultValue: [])
  final List<SingleItemResponse> places;

  PlacesResponse({required this.places});

  factory PlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$PlacesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class UsefulAppResponse {
  @JsonKey(defaultValue: [], name: 'useful_apps')
  final List<SingleItemResponse> usefulApps;

  UsefulAppResponse({required this.usefulApps});

  factory UsefulAppResponse.fromJson(Map<String, dynamic> json) =>
      _$UsefulAppResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsefulAppResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class SingleItemResponse {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String location;
  @JsonKey(defaultValue: '', name: 'short_desc')
  final String shortDescription;
  @JsonKey(defaultValue: '')
  final String info;
  @JsonKey(defaultValue: '')
  final String photo;
  @JsonKey(defaultValue: '', name: 'created_at')
  final String? createdAt;
  @JsonKey(defaultValue: '', name: 'updated_at')
  final String? updatedAt;
  @JsonKey(defaultValue: 0, name: 'city_id')
  final int? cityID;
  @JsonKey(defaultValue: '', name: 'city_name')
  final String? cityName;
  @JsonKey(defaultValue: '')
  final String? link;
  @JsonKey(defaultValue: '', name: 'android_link')
  final String? androidLink;
  @JsonKey(defaultValue: '', name: 'ios_link')
  final String? iosLink;
  @JsonKey(defaultValue: '')
  final String type;
  @JsonKey(defaultValue: 0)
  final double? rating;
  @JsonKey(defaultValue: false)
  final bool? isImageTiny;
  @JsonKey(defaultValue: [])
  final List<ListOfImagesResponse>? images;

  SingleItemResponse({
    required this.id,
    required this.name,
    required this.location,
    required this.info,
    required this.photo,
    required this.shortDescription,
    this.createdAt,
    this.updatedAt,
    this.cityID,
    required this.type,
    this.rating,
    this.link,
    this.androidLink,
    this.iosLink,
    this.cityName,
    this.isImageTiny,
    this.images,
  });

  factory SingleItemResponse.fromResponse(SingleItemModel response) {
    return SingleItemResponse(
      id: response.id,
      name: response.name,
      location: response.location,
      shortDescription: response.shortDescription,
      info: response.info,
      photo: response.photo,
      createdAt: response.createdAt,
      updatedAt: response.updatedAt,
      cityID: response.cityID,
      cityName: response.cityName,
      link: response.link,
      type: response.type,
      rating: response.rating,
      isImageTiny: response.isImageTiny,
      androidLink: response.androidLink,
      iosLink: response.iosLink,
    );
  }

  SingleItemModel toSingleItemHiveModel() {
    return SingleItemModel(
      id: id,
      name: name,
      location: location,
      shortDescription: shortDescription,
      info: info,
      photo: photo,
      type: type,
      link: link,
      androidLink: link,
      iosLink: link,
    );
  }

  factory SingleItemResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SingleItemResponseToJson(this);
}

// {
//   "id": 1,
//   "name": "Khiva",
//   "location": "Khiva, Khorezm",
//   "short_desc": "about Khiva city",
//   "info": "Khiva (Uzbek: Xiva, Хива, خیوه; other names) is a district-level city of approximately 93,000 people in Khorazm Region, Uzbekistan.[2] According to archaeological data, the city was established around 2,500 years ago. In 1997, Khiva celebrated its 2500th anniversary.[3] It is the former capital of Khwarezmia, the Khanate of Khiva, and the Khorezm People's Soviet Republic. Itchan Kala in Khiva was the first site in Uzbekistan to be inscribed on the World Heritage List (1991). The astronomer, historian and polymath, Al-Biruni[4] (973–1048 CE) was born in either Khiva or the nearby city of Kath.",
//   "photo": "http://192.168.0.101:8000/storage/khiva.png",
//   "created_at": "2025-05-18T12:44:48.000000Z",
//   "updated_at": "2025-05-18T12:44:48.000000Z",
//   "restaurants": [
//     {
//       "id": 1,
//       "name": "Gavhar",
//       "short_desc": "about Gavhar",
//       "location": "Urgench, Uzbekistan",
//       "info": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
//       "photo": "gavhar.png",
//       "city_id": 1,
//       "created_at": "2025-05-18T12:44:48.000000Z",
//       "updated_at": "2025-05-18T12:44:48.000000Z"
//     }
//   ],
//   "places": [
//     {
//       "id": 1,
//       "name": "Itchan Kala",
//       "short_desc": "about Itchan Kala",
//       "location": "Khiva, Khorezm",
//       "info": "Itchan Kala (Uzbek: Ichan-Qаl’а) is the walled inner town of the city of Khiva, Uzbekistan. Since 1990, it has been protected as a World Heritage Site.",
//       "photo": "itchan_kala.png",
//       "city_id": 1,
//       "created_at": "2025-05-18T12:44:48.000000Z",
//       "updated_at": "2025-05-18T12:44:48.000000Z"
//     }
//   ],
//   "car_rentals": [
//     {
//       "id": 2,
//       "name": "Xoncar",
//       "short_desc": "asdasd",
//       "location": "asd",
//       "photo": "uploads/1747574439.jpg",
//       "info": "asdasds",
//       "link": "asd",
//       "city_id": 1,
//       "created_at": "2025-05-18T13:20:39.000000Z",
//       "updated_at": "2025-05-18T13:20:39.000000Z"
//     }
//   ]
// }

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class SingleCityResponse {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String location;
  @JsonKey(defaultValue: '', name: 'short_desc')
  final String shortDescription;
  @JsonKey(defaultValue: '')
  final String info;
  @JsonKey(defaultValue: '')
  final String photo;
  @JsonKey(defaultValue: [])
  final List<SingleItemResponse> places;
  @JsonKey(defaultValue: [])
  final List<SingleItemResponse> restaurants;
  @JsonKey(defaultValue: [])
  final List<SingleItemResponse> articles;
  @JsonKey(defaultValue: [], name: 'carRentals')
  final List<SingleItemResponse> carRentals;
  @JsonKey(defaultValue: [])
  final List<SingleItemResponse> tours;
  @JsonKey(defaultValue: [])
  final List<ListOfImagesResponse>? images;
  @JsonKey(defaultValue: '')
  final String type;

  SingleCityResponse({
    required this.id,
    required this.name,
    required this.location,
    required this.info,
    required this.photo,
    required this.shortDescription,
    required this.places,
    required this.restaurants,
    required this.articles,
    required this.carRentals,
    required this.tours,
    required this.images,
    required this.type,
  });

  SingleCityModel toSingleCityModel() {
    return SingleCityModel(
      id: id,
      name: name,
      location: location,
      shortDescription: shortDescription,
      info: info,
      photo: photo,
      places: places.map(SingleItemModel.fromResponse).toList(),
      restaurants: restaurants.map(SingleItemModel.fromResponse).toList(),
      articles: articles.map(SingleItemModel.fromResponse).toList(),
      carRentals: carRentals.map(SingleItemModel.fromResponse).toList(),
      tours: tours.map(SingleItemModel.fromResponse).toList(),
      images: images?.map(ListOfImagesModel.fromResponse).toList(),
      type: type,
    );
  }

  factory SingleCityResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleCityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SingleCityResponseToJson(this);
}

// "images": [
//   {
//     "path": "http://travel.getcontact.uz/storage/images/1751480027.png"
//   },
//   {
//     "path": "http://travel.getcontact.uz/storage/images/1751480116.png"
//   }
// ],

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ListOfImagesResponse {
  @JsonKey(defaultValue: '')
  final String path;

  ListOfImagesResponse({required this.path});

  factory ListOfImagesResponse.fromResponse(ListOfImagesModel images) {
    return ListOfImagesResponse(path: images.path);
  }

  factory ListOfImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOfImagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListOfImagesResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ArticlesResponse {
  @JsonKey(defaultValue: [])
  final List<SingleItemResponse> articles;

  ArticlesResponse({required this.articles});

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ToursResponse {
  @JsonKey(defaultValue: [])
  final List<SingleItemResponse> tours;

  ToursResponse({required this.tours});

  factory ToursResponse.fromJson(Map<String, dynamic> json) =>
      _$ToursResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ToursResponseToJson(this);
}
