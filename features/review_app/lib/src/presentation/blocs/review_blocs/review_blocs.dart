import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:bloc/bloc.dart';
import 'package:review_app/review_app.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final CheckReviewCountUseCase checkReviewCountUseCase;
  final SaveReviewCountUseCase saveReviewCountUseCase;

  ReviewBloc({
    required this.checkReviewCountUseCase,
    required this.saveReviewCountUseCase,
  }) : super(InitState()) {
    on<SendReviewEvent>((event, emit) async {
      final result = await checkReviewCountUseCase(NoParams());
      result.fold((l) {
        saveReviewCountUseCase.call(NoParams());
      }, (shouldShow) {
        if (shouldShow) {
          emit(ShowReview());
        }

        saveReviewCountUseCase.call(NoParams());
      });
    });

    on<DissableAdsVideoEvent>(
      (event, emit) => emit(
        DissableAdsVideoState(),
      ),
    );

    on<SelectedStatusEvent>(
      (event, emit) => emit(
        SelectedStatusState(event.status),
      ),
    );
  }
}

enum FeelStatus {
  sad,
  happy,
  normal,
  excited,
}
