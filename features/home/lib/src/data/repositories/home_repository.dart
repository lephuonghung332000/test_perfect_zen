import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../domain/repositories/repositories.dart';
import '../data.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, bool>> getFirstTimeStatus() async {
    return await localDataSource.getFirstTimeStatus();
  }

  @override
  Future<Either<Failure, void>> setDoneFirstTimeStatus() async {
    return await localDataSource.setFirstTimeDone();
  }
}
