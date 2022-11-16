import 'package:dependencies/dependencies.dart';

abstract class FeedbackEvent extends Equatable {
  const FeedbackEvent();
}

class SendFeedbackEvent extends FeedbackEvent {
  const SendFeedbackEvent();

  @override
  List<Object?> get props => [];
}

class InputEmailFeedbackEvent extends FeedbackEvent {
  final String email;

  const InputEmailFeedbackEvent({required this.email});

  @override
  List<Object?> get props => [email];
}
