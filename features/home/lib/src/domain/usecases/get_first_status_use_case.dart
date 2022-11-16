import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../repositories/repositories.dart';

class GetFirstStatusUseCase implements UseCase<bool, NoParams> {
  final HomeRepository repository;

  GetFirstStatusUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.getFirstTimeStatus();
  }
}
