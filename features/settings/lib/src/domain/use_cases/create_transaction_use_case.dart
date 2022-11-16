import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:settings/settings.dart';

class CreateTransactionUseCase
    implements UseCase<TransactionDTO?, CreateTransactionParams> {
  final TransactionRepository repository;

  CreateTransactionUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, TransactionDTO?>> call(createTransactionParams) async {
    return await repository.createTransaction(
      createTransactionParams.iosReceipt,
      createTransactionParams.androidProductId,
    );
  }
}

class CreateTransactionParams {
  final String? iosReceipt;
  final String? androidProductId;
  CreateTransactionParams({
    this.iosReceipt,
    this.androidProductId,
  });
}
