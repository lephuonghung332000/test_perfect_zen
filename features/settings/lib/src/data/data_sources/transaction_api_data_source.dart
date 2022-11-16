import 'dart:convert';
import 'dart:core';

import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:http/http.dart' as http;

abstract class TransactionApiDataSource {
  Future<Either<Failure, Map<String, dynamic>>> verifyReceipt(
      String iosReceipt);
}

class TransactionApiDataSourceImpl implements TransactionApiDataSource {
  TransactionApiDataSourceImpl();

  @override
  Future<Either<Failure, Map<String, dynamic>>> verifyReceipt(
      String iosReceipt) async {
    try {
      String url =
          GetIt.I<GlobalConfiguration>().getValue('verify_receipt_url');
      String password =
          GetIt.I<GlobalConfiguration>().getValue('shared_secret');
      final result = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'password': password,
            'exclude-old-transactions': 'true',
            'receipt-data': iosReceipt,
          },
        ),
      );

      Map<String, dynamic> data = json.decode(result.body);

      if (data['status'] == 21007) {
        url = 'https://sandbox.itunes.apple.com/verifyReceipt';
        final reCallResult = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'password': password,
              'exclude-old-transactions': 'true',
              'receipt-data': iosReceipt,
            },
          ),
        );
        data = json.decode(reCallResult.body);
      }

      return Right(data);
    } on DioError catch (e) {
      throw NetworkUtils.dioErrorToException(e);
    }
  }
}

class CustomFailure extends Failure {
  final String message;
  final int code;

  CustomFailure({
    required this.message,
    required this.code,
  }) : super(code: code, message: message);

  @override
  List<Object> get props => [message, code];

  @override
  bool get stringify => true;
}
