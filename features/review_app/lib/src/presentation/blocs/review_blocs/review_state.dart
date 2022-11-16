import 'package:dependencies/dependencies.dart';
import 'package:review_app/review_app.dart';
import 'package:uuid/uuid.dart';

abstract class ReviewState extends Equatable {}

class InitState extends ReviewState {
  @override
  List<Object?> get props => [];
}

class ShowReview extends ReviewState {
  @override
  List<Object?> get props => [];
}

class ShowReviewFailed extends ReviewState {
  @override
  List<Object?> get props => [];
}

class SelectedStatusState extends ReviewState {
  final FeelStatus status;

  SelectedStatusState(this.status);

  @override
  List<Object?> get props => [status];
}

class DissableAdsVideoState extends ReviewState {
  @override
  List<Object?> get props => [const Uuid().v4()];
}
