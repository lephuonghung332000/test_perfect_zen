import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:settings/settings.dart';

class GetCurrentTransactionUseCase
    implements UseCase<TransactionDTO?, NoParams> {
  final TransactionRepository repository;

  GetCurrentTransactionUseCase({required this.repository});

  @override
  Future<Either<Failure, TransactionDTO?>> call(NoParams params) async {
    return await repository.getCurrentTransaction(params);
  }
}
