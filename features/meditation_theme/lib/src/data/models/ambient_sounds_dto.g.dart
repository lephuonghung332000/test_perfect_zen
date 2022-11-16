// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ambient_sounds_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AmbientSoundsDTOAdapter extends TypeAdapter<AmbientSoundsDTO> {
  @override
  final int typeId = 3;

  @override
  AmbientSoundsDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AmbientSoundsDTO(
      volume: fields[30] as double,
      listMusicDTO: (fields[31] as List).cast<MusicDTO>(),
    );
  }

  @override
  void write(BinaryWriter writer, AmbientSoundsDTO obj) {
    writer
      ..writeByte(2)
      ..writeByte(30)
      ..write(obj.volume)
      ..writeByte(31)
      ..write(obj.listMusicDTO);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AmbientSoundsDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
