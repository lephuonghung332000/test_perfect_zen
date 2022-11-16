import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

abstract class SettingRepository {
  Future<Either<Failure, void>> sendFeedback({required String email, required String message});
}
