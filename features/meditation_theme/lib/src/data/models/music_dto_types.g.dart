// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_dto_types.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicDtoTypesAdapter extends TypeAdapter<MusicDtoTypes> {
  @override
  final int typeId = 5;

  @override
  MusicDtoTypes read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 50:
        return MusicDtoTypes.ambientSound;
      case 51:
        return MusicDtoTypes.intervalBell;
      case 52:
        return MusicDtoTypes.mainMusic;
      default:
        return MusicDtoTypes.ambientSound;
    }
  }

  @override
  void write(BinaryWriter writer, MusicDtoTypes obj) {
    switch (obj) {
      case MusicDtoTypes.ambientSound:
        writer.writeByte(50);
        break;
      case MusicDtoTypes.intervalBell:
        writer.writeByte(51);
        break;
      case MusicDtoTypes.mainMusic:
        writer.writeByte(52);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicDtoTypesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
