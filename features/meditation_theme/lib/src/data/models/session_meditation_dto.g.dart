// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_meditation_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionDurationDTOAdapter extends TypeAdapter<SessionDurationDTO> {
  @override
  final int typeId = 11;

  @override
  SessionDurationDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SessionDurationDTO(
      createdAt: fields[110] as DateTime,
      duration: fields[111] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SessionDurationDTO obj) {
    writer
      ..writeByte(2)
      ..writeByte(110)
      ..write(obj.createdAt)
      ..writeByte(111)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionDurationDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
