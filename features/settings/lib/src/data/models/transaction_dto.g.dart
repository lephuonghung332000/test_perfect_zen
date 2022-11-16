// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionDTOAdapter extends TypeAdapter<TransactionDTO> {
  @override
  final int typeId = 10;

  @override
  TransactionDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionDTO(
      productId: fields[102] as String,
      transactionId: fields[103] as String,
      originalTransactionId: fields[104] as String,
      purchaseDate: fields[105] as DateTime,
      expiredDate: fields[106] as DateTime,
      cancellationDate: fields[107] as DateTime?,
      token: fields[108] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionDTO obj) {
    writer
      ..writeByte(7)
      ..writeByte(102)
      ..write(obj.productId)
      ..writeByte(103)
      ..write(obj.transactionId)
      ..writeByte(104)
      ..write(obj.originalTransactionId)
      ..writeByte(105)
      ..write(obj.purchaseDate)
      ..writeByte(106)
      ..write(obj.expiredDate)
      ..writeByte(107)
      ..write(obj.cancellationDate)
      ..writeByte(108)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
