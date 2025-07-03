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
  final String createdAt;

  @HiveField(7)
  final String updatedAt;

  @HiveField(8)
  final int? cityID;

  @HiveField(9)
  final String? cityName;

  @HiveField(10)
  final String? link;

  @HiveField(11)
  final String? type;

  @HiveField(12)
  final double? rating;

  @HiveField(13)
  final bool? isImageTiny;

  SingleItemModel({
    required this.id,
    required this.name,
    required this.location,
    required this.shortDescription,
    required this.info,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    this.cityID,
    this.cityName,
    this.link,
    this.type,
    this.rating,
    this.isImageTiny,
  });

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
    );
  }
}
