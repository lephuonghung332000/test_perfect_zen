import 'package:dependencies/dependencies.dart';

abstract class FeedbackState extends Equatable {}

class InitialState extends FeedbackState {
  @override
  List<Object?> get props => [];
}

abstract class SubmitFeedback extends FeedbackState {}

class SendFeedbackSuccess extends FeedbackState {
  @override
  List<Object?> get props => [];
}

class SendFeedbackFailed extends FeedbackState {
  @override
  List<Object?> get props => [];
}

class EnableSubmitFeedback extends SubmitFeedback {
  @override
  List<Object?> get props => [];
}

class DisableSubmitFeedback extends SubmitFeedback {
  @override
  List<Object?> get props => [];
}
