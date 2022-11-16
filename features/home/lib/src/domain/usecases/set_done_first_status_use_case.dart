import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import '../repositories/repositories.dart';

class SetDoneFirstUseCase implements UseCase<void, NoParams> {
  final HomeRepository repository;

  SetDoneFirstUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.setDoneFirstTimeStatus();
  }
}
