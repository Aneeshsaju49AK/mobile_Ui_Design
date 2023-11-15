// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlaceModelAdapter extends TypeAdapter<PlaceModel> {
  @override
  final int typeId = 1;

  @override
  PlaceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaceModel(
      district: fields[0] as String,
      category: fields[1] as String,
      placeName: fields[2] as String,
      subLocation: fields[3] as String,
      googleMapsPath: fields[4] as String,
      description: fields[5] as String,
      images: (fields[6] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PlaceModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.district)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.placeName)
      ..writeByte(3)
      ..write(obj.subLocation)
      ..writeByte(4)
      ..write(obj.googleMapsPath)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
