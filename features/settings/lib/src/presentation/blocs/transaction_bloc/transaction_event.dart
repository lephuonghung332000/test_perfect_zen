import 'package:dependencies/dependencies.dart';

abstract class TransactionEvent extends Equatable {}

class GetCurrentTransactionEvent extends TransactionEvent {
  GetCurrentTransactionEvent();

  @override
  List<Object?> get props => [];
}
