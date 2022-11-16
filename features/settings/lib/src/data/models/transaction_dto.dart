import 'package:dependencies/dependencies.dart';
import 'package:json_annotation/json_annotation.dart';
part 'transaction_dto.g.dart';

@HiveType(typeId: 10)
@JsonSerializable()
class TransactionDTO extends Equatable {
  const TransactionDTO({
    required this.productId,
    required this.transactionId,
    required this.originalTransactionId,
    required this.purchaseDate,
    required this.expiredDate,
    this.cancellationDate,
    required this.token,
  });

  @HiveField(102)
  @JsonKey(name: 'product_id', required: true)
  final String productId;

  @HiveField(103)
  @JsonKey(name: 'transaction_id', required: true)
  final String transactionId;

  @HiveField(104)
  @JsonKey(name: 'original_transaction_id', required: true)
  final String originalTransactionId;

  @HiveField(105)
  @JsonKey(name: 'purchase_date', required: true)
  final DateTime purchaseDate;

  @HiveField(106)
  @JsonKey(name: 'expires_date', required: true)
  final DateTime expiredDate;

  @HiveField(107)
  @JsonKey(name: 'cancellation_date', required: false)
  final DateTime? cancellationDate;

  @HiveField(108)
  @JsonKey(name: 'token', required: true)
  final String token;

  factory TransactionDTO.fromJson(Map<String, dynamic> json) => TransactionDTO(
        productId: json['productId'],
        transactionId: json['transactionId'],
        originalTransactionId: json['originalTransactionId'],
        purchaseDate: json['purchaseDate'],
        expiredDate: json['expiredDate'],
        cancellationDate: json['cancellationDate'],
        token: json['token'],
      );

  @override
  List<Object?> get props => [
        productId,
        transactionId,
        originalTransactionId,
        purchaseDate,
        expiredDate,
        cancellationDate,
        token,
      ];
}
