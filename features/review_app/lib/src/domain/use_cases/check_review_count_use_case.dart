import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../domain.dart';

class CheckReviewCountUseCase implements UseCase<bool, NoParams> {
  final SettingRepository repository;
  CheckReviewCountUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    final current = await repository.getReviewCount();

    return current.fold((l) => Left(l), (r) => Right(r % 7 == 2));
  }
}
