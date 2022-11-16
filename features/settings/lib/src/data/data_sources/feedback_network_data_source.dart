import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

abstract class FeedbackNetworkDataSource {
  Future<Either<Failure, void>> sendFeedback({required String email, required String message});
}

class FeedbackNetworkDataSourceImpl extends FeedbackNetworkDataSource {
  DoorbellNetworkManager networkManager;

  FeedbackNetworkDataSourceImpl({required this.networkManager});

  @override
  Future<Either<Failure, void>> sendFeedback(
      {required String email, required String message}) async {
    return networkManager.post(body: {
      'email': email,
      'message': message,
    });
  }
}
