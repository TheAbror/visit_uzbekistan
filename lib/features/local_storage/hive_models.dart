import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'hive_models.g.dart';

@HiveType(typeId: 0)
class LocalStorage extends HiveObject {
  @HiveField(0, defaultValue: [])
  final List<SingleItemModel> localStorageItems;

  LocalStorage({required this.localStorageItems});
}

@HiveType(typeId: 1)
class SingleItemModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String location;
  @HiveField(3)
  final String shortDescription;
  @HiveField(4)
  final String info;
  @HiveField(5)
  final String photo;
  @HiveField(6)
  final String? createdAt;
  @HiveField(7)
  final String? updatedAt;
  @HiveField(8)
  final int? cityID;
  @HiveField(9)
  final String? cityName;
  @HiveField(10)
  final String? link;
  @HiveField(11)
  final String type;
  @HiveField(12)
  final double? rating;
  @HiveField(13)
  final bool? isImageTiny;
  @HiveField(14)
  final String? androidLink;
  @HiveField(15)
  final String? iosLink;

  SingleItemModel({
    required this.id,
    required this.name,
    required this.location,
    required this.shortDescription,
    required this.info,
    required this.photo,
    this.createdAt,
    this.updatedAt,
    this.cityID,
    this.cityName,
    this.link,
    this.androidLink,
    this.iosLink,
    required this.type,
    this.rating,
    this.isImageTiny,
  });

  factory SingleItemModel.fromResponse(SingleItemResponse response) {
    return SingleItemModel(
      id: response.id,
      name: response.name,
      location: response.location,
      shortDescription: response.shortDescription,
      info: response.info,
      photo: response.photo,
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

  SingleItemResponse toSingleItemResponse() {
    return SingleItemResponse(
      id: id,
      name: name,
      location: location,
      shortDescription: shortDescription,
      info: info,
      photo: photo,
      createdAt: createdAt,
      updatedAt: updatedAt,
      type: type,
      link: link,
      androidLink: androidLink,
      iosLink: iosLink,
    );
  }
}

@HiveType(typeId: 2)
class LocalStorageForCities extends HiveObject {
  @HiveField(0, defaultValue: [])
  final List<SingleCityModel> localStorageCityItems;

  LocalStorageForCities({required this.localStorageCityItems});
}

@HiveType(typeId: 3)
class SingleCityModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String location;
  @HiveField(3)
  final String shortDescription;
  @HiveField(4)
  final String info;
  @HiveField(5)
  final String photo;
  @HiveField(6)
  final List<SingleItemModel> places;
  @HiveField(7)
  final List<SingleItemModel> restaurants;
  @HiveField(8)
  final List<SingleItemModel> articles;
  @HiveField(9)
  final List<SingleItemModel> carRentals;
  @HiveField(10)
  final List<SingleItemModel> tours;
  @HiveField(11)
  final List<ListOfImagesModel>? images;
  @HiveField(12)
  final String type;

  SingleCityModel({
    required this.id,
    required this.name,
    required this.location,
    required this.shortDescription,
    required this.info,
    required this.photo,
    required this.places,
    required this.restaurants,
    required this.articles,
    required this.carRentals,
    required this.tours,
    required this.images,
    required this.type,
  });

  SingleCityResponse toSingleCityResponse() {
    return SingleCityResponse(
      id: id,
      name: name,
      location: location,
      shortDescription: shortDescription,
      info: info,
      photo: photo,
      places: places.map(SingleItemResponse.fromResponse).toList(),
      restaurants: restaurants.map(SingleItemResponse.fromResponse).toList(),
      articles: articles.map(SingleItemResponse.fromResponse).toList(),
      carRentals: carRentals.map(SingleItemResponse.fromResponse).toList(),
      tours: tours.map(SingleItemResponse.fromResponse).toList(),
      images: images?.map(ListOfImagesResponse.fromResponse).toList(),
      type: type,
    );
  }

  SingleItemResponse toSingleItemResponse() {
    return SingleItemResponse(
      id: id,
      name: name,
      location: location,
      shortDescription: shortDescription,
      info: info,
      photo: photo,
      createdAt: '',
      images: images?.map(ListOfImagesResponse.fromResponse).toList(),
      type: type,
    );
  }
}

@HiveType(typeId: 4)
class ListOfImagesModel extends HiveObject {
  @HiveField(0)
  final String path;

  ListOfImagesModel({required this.path});

  factory ListOfImagesModel.fromResponse(ListOfImagesResponse images) {
    return ListOfImagesModel(path: images.path);
  }

  ListOfImagesResponse toListOfImagesResponse() {
    return ListOfImagesResponse(path: path);
  }
}

@HiveType(typeId: 5)
class UserModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String createdAt;
  @HiveField(4)
  final String updatedAt;
  @HiveField(5)
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
  });
}
