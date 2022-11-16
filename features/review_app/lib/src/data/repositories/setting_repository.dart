import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../review_app.dart';

class SettingRepositoryImpl implements SettingRepository {
  final ReviewLocalDataSource localDataSource;

  SettingRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, int>> getReviewCount() {
    return localDataSource.getReviewCount();
  }

  @override
  Future<Either<Failure, void>> saveReviewCount(int time) {
    return localDataSource.saveReviewCount(time);
  }
}
