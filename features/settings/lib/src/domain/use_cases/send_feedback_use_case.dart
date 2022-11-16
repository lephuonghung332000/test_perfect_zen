import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:settings/src/domain/entities/feedback_data.dart';

import '../repositories/repositories.dart';

class SendFeedBackUseCase extends UseCase<void, FeedbackData> {
  final SettingRepository repository;

  SendFeedBackUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(FeedbackData params) {
    return repository.sendFeedback(email: params.email, message: params.message);
  }
}
