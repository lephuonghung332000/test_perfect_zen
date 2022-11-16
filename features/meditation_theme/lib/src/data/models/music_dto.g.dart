// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicDTOAdapter extends TypeAdapter<MusicDTO> {
  @override
  final int typeId = 0;

  @override
  MusicDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MusicDTO(
      name: fields[0] as String,
      iconPath: fields[2] as String?,
      activeIconPath: fields[3] as String?,
      type: fields[4] as MusicDtoTypes,
      active: fields[5] as bool,
      isAssetFile: fields[7] as bool,
      musicPlayerId: fields[8] as String,
      filePath: fields[1] as String?,
      assetPath: fields[9] as String?,
      onlineUrl: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MusicDTO obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.filePath)
      ..writeByte(2)
      ..write(obj.iconPath)
      ..writeByte(3)
      ..write(obj.activeIconPath)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.active)
      ..writeByte(6)
      ..write(obj.onlineUrl)
      ..writeByte(7)
      ..write(obj.isAssetFile)
      ..writeByte(8)
      ..write(obj.musicPlayerId)
      ..writeByte(9)
      ..write(obj.assetPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
