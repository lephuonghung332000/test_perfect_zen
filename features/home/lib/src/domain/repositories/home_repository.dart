import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

abstract class HomeRepository {
  Future<Either<Failure, bool>> getFirstTimeStatus();
  Future<Either<Failure, void>> setDoneFirstTimeStatus();
}
