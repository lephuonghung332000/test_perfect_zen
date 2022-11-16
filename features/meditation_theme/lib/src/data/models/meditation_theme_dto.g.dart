// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation_theme_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeditationThemeDTOAdapter extends TypeAdapter<MeditationThemeDTO> {
  @override
  final int typeId = 4;

  @override
  MeditationThemeDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeditationThemeDTO(
      name: fields[40] as String,
      duration: fields[41] as int,
      intervalBellDTO: fields[42] as IntervalBellDTO?,
      mainMusicDTO: fields[43] as MainMusicDTO?,
      ambientSoundsDTO: fields[44] as AmbientSoundsDTO?,
      isPremium: fields[45] as bool,
      createdAt: fields[46] as DateTime,
      updatedAt: fields[47] as DateTime,
      isDefault: fields[48] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MeditationThemeDTO obj) {
    writer
      ..writeByte(9)
      ..writeByte(40)
      ..write(obj.name)
      ..writeByte(41)
      ..write(obj.duration)
      ..writeByte(42)
      ..write(obj.intervalBellDTO)
      ..writeByte(43)
      ..write(obj.mainMusicDTO)
      ..writeByte(44)
      ..write(obj.ambientSoundsDTO)
      ..writeByte(45)
      ..write(obj.isPremium)
      ..writeByte(46)
      ..write(obj.createdAt)
      ..writeByte(47)
      ..write(obj.updatedAt)
      ..writeByte(48)
      ..write(obj.isDefault);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeditationThemeDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
