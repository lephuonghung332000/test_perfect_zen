import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

abstract class HomeLocalDataSource {
  Future<Either<Failure, bool>> getFirstTimeStatus();
  Future<Either<Failure, void>> setFirstTimeDone();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final LocalStorageManager localStorageManager;

  HomeLocalDataSourceImpl({required this.localStorageManager});

  @override
  Future<Either<Failure, bool>> getFirstTimeStatus() async {
    try {
      final value = localStorageManager.getBool(
        'get_first_time',
        defaultValue: true,
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
  Future<Either<Failure, void>> setFirstTimeDone() async {
    try {
      await localStorageManager.saveBool(key: 'get_first_time', value: false);
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
