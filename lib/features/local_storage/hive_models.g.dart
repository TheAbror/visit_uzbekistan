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
      createdAt: fields[6] as String,
      updatedAt: fields[7] as String,
      cityID: fields[8] as int?,
      cityName: fields[9] as String?,
      link: fields[10] as String?,
      type: fields[11] as String?,
      rating: fields[12] as double?,
      isImageTiny: fields[13] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, SingleItemModel obj) {
    writer
      ..writeByte(14)
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
      ..write(obj.isImageTiny);
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
