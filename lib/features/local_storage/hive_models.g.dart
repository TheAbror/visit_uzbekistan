// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalStorageAdapter extends TypeAdapter<LocalStorage> {
  @override
  final int typeId = 0;

  @override
  LocalStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalStorage(
      localStorageItems:
          fields[0] == null ? [] : (fields[0] as List).cast<SingleItemModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, LocalStorage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.localStorageItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SingleItemModelAdapter extends TypeAdapter<SingleItemModel> {
  @override
  final int typeId = 1;

  @override
  SingleItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SingleItemModel(
      id: fields[0] as int,
      name: fields[1] as String,
      location: fields[2] as String,
      shortDescription: fields[3] as String,
      info: fields[4] as String,
      photo: fields[5] as String,
      createdAt: fields[6] as String?,
      updatedAt: fields[7] as String?,
      cityID: fields[8] as int?,
      cityName: fields[9] as String?,
      link: fields[10] as String?,
      androidLink: fields[14] as String?,
      iosLink: fields[15] as String?,
      type: fields[11] as String,
      rating: fields[12] as double?,
      isImageTiny: fields[13] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, SingleItemModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.shortDescription)
      ..writeByte(4)
      ..write(obj.info)
      ..writeByte(5)
      ..write(obj.photo)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt)
      ..writeByte(8)
      ..write(obj.cityID)
      ..writeByte(9)
      ..write(obj.cityName)
      ..writeByte(10)
      ..write(obj.link)
      ..writeByte(11)
      ..write(obj.type)
      ..writeByte(12)
      ..write(obj.rating)
      ..writeByte(13)
      ..write(obj.isImageTiny)
      ..writeByte(14)
      ..write(obj.androidLink)
      ..writeByte(15)
      ..write(obj.iosLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SingleItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LocalStorageForCitiesAdapter extends TypeAdapter<LocalStorageForCities> {
  @override
  final int typeId = 2;

  @override
  LocalStorageForCities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalStorageForCities(
      localStorageCityItems:
          fields[0] == null ? [] : (fields[0] as List).cast<SingleCityModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, LocalStorageForCities obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.localStorageCityItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalStorageForCitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SingleCityModelAdapter extends TypeAdapter<SingleCityModel> {
  @override
  final int typeId = 3;

  @override
  SingleCityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SingleCityModel(
      id: fields[0] as int,
      name: fields[1] as String,
      location: fields[2] as String,
      shortDescription: fields[3] as String,
      info: fields[4] as String,
      photo: fields[5] as String,
      places: (fields[6] as List).cast<SingleItemModel>(),
      restaurants: (fields[7] as List).cast<SingleItemModel>(),
      articles: (fields[8] as List).cast<SingleItemModel>(),
      carRentals: (fields[9] as List).cast<SingleItemModel>(),
      tours: (fields[10] as List).cast<SingleItemModel>(),
      images: (fields[11] as List?)?.cast<ListOfImagesModel>(),
      type: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SingleCityModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.shortDescription)
      ..writeByte(4)
      ..write(obj.info)
      ..writeByte(5)
      ..write(obj.photo)
      ..writeByte(6)
      ..write(obj.places)
      ..writeByte(7)
      ..write(obj.restaurants)
      ..writeByte(8)
      ..write(obj.articles)
      ..writeByte(9)
      ..write(obj.carRentals)
      ..writeByte(10)
      ..write(obj.tours)
      ..writeByte(11)
      ..write(obj.images)
      ..writeByte(12)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SingleCityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ListOfImagesModelAdapter extends TypeAdapter<ListOfImagesModel> {
  @override
  final int typeId = 4;

  @override
  ListOfImagesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListOfImagesModel(
      path: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ListOfImagesModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListOfImagesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 5;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as int,
      name: fields[1] as String,
      email: fields[2] as String,
      createdAt: fields[3] as String,
      updatedAt: fields[4] as String,
      token: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
