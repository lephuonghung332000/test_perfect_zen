// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interval_bell_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IntervalBellDTOAdapter extends TypeAdapter<IntervalBellDTO> {
  @override
  final int typeId = 1;

  @override
  IntervalBellDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IntervalBellDTO(
      duration: fields[10] as int,
      volume: fields[11] as double,
      musicDTO: fields[12] as MusicDTO,
    );
  }

  @override
  void write(BinaryWriter writer, IntervalBellDTO obj) {
    writer
      ..writeByte(3)
      ..writeByte(10)
      ..write(obj.duration)
      ..writeByte(11)
      ..write(obj.volume)
      ..writeByte(12)
      ..write(obj.musicDTO);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IntervalBellDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
