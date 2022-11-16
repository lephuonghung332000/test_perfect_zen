import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import 'package:settings/src/data/data_sources/data_source.dart';

import '../../domain/repositories/repositories.dart';

class SettingRepositoryImpl implements SettingRepository {
  final FeedbackNetworkDataSource dataSource;

  SettingRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, void>> sendFeedback(
      {required String email, required String message}) async {
    return await dataSource.sendFeedback(email: email, message: message);
  }
}
