import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:settings/settings.dart';
import 'package:review_app/review_app.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final GetCurrentTransactionUseCase getCurrentTransactionUseCase;

  TransactionBloc({
    required this.getCurrentTransactionUseCase,
  }) : super(const InitialTransactionState()) {
    on<GetCurrentTransactionEvent>((event, emit) async {
      final result = await getCurrentTransactionUseCase(NoParams());
      result.fold(
        (failure) {},
        (transactionDTO) {
          if (transactionDTO == null) {
            emit(const NoTransactionState());
          } else {
            bool expired = _checkExpiredTransaction(transactionDTO);

            if (expired) {
              emit(const TransactionExpiredState());
            } else {
              emit(
                TransactionAvailableState(
                  purchaseDate: transactionDTO.purchaseDate,
                  productId: transactionDTO.productId,
                ),
              );
              BlocProvider.of<ReviewBloc>(
                      Routes.navigatorStateKey.currentContext!)
                  .add(const DissableAdsVideoEvent());
            }
          }
        },
      );
    });
  }

  bool _checkExpiredTransaction(TransactionDTO transactionDTO) {
    final now = DateTime.now().toUtc();
    return transactionDTO.expiredDate.isBefore(now);
  }
}
