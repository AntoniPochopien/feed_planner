// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_with_dominating_color_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageWithDominatingColorDbAdapter
    extends TypeAdapter<ImageWithDominatingColorDb> {
  @override
  final int typeId = 0;

  @override
  ImageWithDominatingColorDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageWithDominatingColorDb(
      filePath: fields[0] as String,
      color: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ImageWithDominatingColorDb obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.filePath)
      ..writeByte(1)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageWithDominatingColorDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
