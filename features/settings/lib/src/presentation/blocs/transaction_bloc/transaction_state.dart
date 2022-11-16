import 'package:dependencies/dependencies.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();
}

class InitialTransactionState extends TransactionState {
  const InitialTransactionState();

  @override
  List<Object?> get props => [];
}

class TransactionAvailableState extends TransactionState {
  final DateTime purchaseDate;
  final String productId;
  const TransactionAvailableState({
    required this.purchaseDate,
    required this.productId,
  });

  @override
  List<Object?> get props => [purchaseDate, productId];
}

class NoTransactionState extends TransactionState {
  const NoTransactionState();

  @override
  List<Object?> get props => [];
}

class TransactionExpiredState extends TransactionState {
  const TransactionExpiredState();

  @override
  List<Object?> get props => [];
}
