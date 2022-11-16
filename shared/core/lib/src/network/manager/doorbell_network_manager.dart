import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:http/http.dart' as http;

abstract class DoorbellNetworkManager {
  Future<Either<Failure, String>> post({required Map<String, dynamic> body});
}

class DoorbellNetworkManagerImpl implements DoorbellNetworkManager {
  final _client = http.Client();
  final httpsUri = Uri(
      scheme: 'https',
      host: 'doorbell.io',
      pathSegments: ['api', 'applications', '13295', 'submit'],
      queryParameters: {'key': 'XZwGxY1OkCBFzFAAbn4qsQ6zbDbuzbdAoQ2lTzRwzTvPPx72vJjCHAj599I8zQIh'});

  @override
  Future<Either<Failure, String>> post({required Map<String, dynamic> body}) async {
    try {
      final response = await _client.post(httpsUri, body: body);

      if (response.statusCode >= 200 && response.statusCode < 207) {
        return Right(response.body);
      }

      return Left(InternalServerFailure(
        code: response.statusCode,
        message: response.body,
      ));
    } catch (_) {
      return Left(DefaultServerFailure(code: -1, message: 'API call failed'));
    }
  }
}
