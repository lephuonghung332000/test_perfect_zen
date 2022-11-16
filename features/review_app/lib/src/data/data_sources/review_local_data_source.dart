import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

abstract class ReviewLocalDataSource {
  Future<Either<Failure, int>> getReviewCount();

  Future<Either<Failure, void>> saveReviewCount(int time);
}

class ReviewLocalDataSourceImpl extends ReviewLocalDataSource {
  final LocalStorageManager localStorageManager;

  ReviewLocalDataSourceImpl({required this.localStorageManager});

  @override
  Future<Either<Failure, int>> getReviewCount() async {
    try {
      final value = localStorageManager.getInt(
        defaultValue: 0,
        key: 'count_feedback',
      );
      return Right(value);
    } on Exception catch (error) {
      return Left(
        LocalStorageFailure(
          exception: error,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> saveReviewCount(int time) async {
    try {
      await localStorageManager.saveInt(value: time, key: 'count_feedback');
      return const Right(null);
    } on Exception catch (error) {
      return Left(
        LocalStorageFailure(
          exception: error,
        ),
      );
    }
  }
}
