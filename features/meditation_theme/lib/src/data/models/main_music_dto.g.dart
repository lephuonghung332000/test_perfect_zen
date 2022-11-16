// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_music_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainMusicDTOAdapter extends TypeAdapter<MainMusicDTO> {
  @override
  final int typeId = 2;

  @override
  MainMusicDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainMusicDTO(
      volume: fields[20] as double,
      musicDTO: fields[21] as MusicDTO,
    );
  }

  @override
  void write(BinaryWriter writer, MainMusicDTO obj) {
    writer
      ..writeByte(2)
      ..writeByte(20)
      ..write(obj.volume)
      ..writeByte(21)
      ..write(obj.musicDTO);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainMusicDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
