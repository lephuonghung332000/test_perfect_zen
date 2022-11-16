import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

abstract class SettingRepository {
  Future<Either<Failure, int>> getReviewCount();

  Future<Either<Failure, void>> saveReviewCount(int time);
}
