import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../domain.dart';

class SaveReviewCountUseCase implements UseCase<void, NoParams> {
  final SettingRepository repository;
  SaveReviewCountUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final current = await repository.getReviewCount();

    if (current.isLeft()) {
      return current;
    }

    final currentTime = current.getOrElse(() => 0);

    return await repository.saveReviewCount(currentTime + 1);
  }
}
