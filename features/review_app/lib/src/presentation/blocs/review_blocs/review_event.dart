import 'package:dependencies/dependencies.dart';
import 'package:review_app/review_app.dart';

abstract class ReviewEvent extends Equatable {
  const ReviewEvent();
}

class SendReviewEvent extends ReviewEvent {
  const SendReviewEvent();

  @override
  List<Object?> get props => [];
}

class SelectedStatusEvent extends ReviewEvent {
  final FeelStatus status;

  const SelectedStatusEvent(this.status);

  @override
  List<Object?> get props => [status];
}

class DissableAdsVideoEvent extends ReviewEvent {
  const DissableAdsVideoEvent();

  @override
  List<Object?> get props => [];
}
