import 'package:component/atom/toast.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:reports/src/domain/usecases/usecase.dart';
import 'package:reports/src/presentation/bloc/blocs.dart';

class SessionMeditationBloc
    extends Bloc<SessionMeditationEvent, SessionMeditationState> {
  final GetListSessionMeditationThemeUseCase getListSessionMeditationUseCase;
  final AddSessionMeditationUseCase addSessionMeditationUseCase;
  final GetTimesSessionMeditationUseCase getTimeSessionMeditationUseCase;

  SessionMeditationBloc({
    required this.getListSessionMeditationUseCase,
    required this.addSessionMeditationUseCase,
    required this.getTimeSessionMeditationUseCase,
  }) : super(SessionMeditationInitial()) {
    on<LoadSessionMeditationEvent>((event, emit) async {
      final result = await getListSessionMeditationUseCase(NoParams());
      result.fold(
        (failure) {
          Toast.show(message: S.current.get_list_meditation_theme_failed);
        },
        (listSessionMeditation) async {
          emit(SessionMeditationLoadedState(listSessionMeditation));
          add(GetTimesSessionMeditationEvent(listSessionMeditation));
        },
      );
    });

    on<GetTimesSessionMeditationEvent>((event, emit) async {
      final result =
          await getTimeSessionMeditationUseCase(event.listSessionMeditation);
      result.fold(
        (failure) {
          Toast.show(message: S.current.get_list_meditation_theme_failed);
        },
        (consecutiveness) {
          emit(GetTimesSessionMeditationState(consecutiveness));
        },
      );
    });

    on<AddSessionMeditationEvent>((event, emit) async {
      final result = await addSessionMeditationUseCase(event.duration);
      result.fold(
        (failure) {
          Toast.show(message: S.current.get_list_meditation_theme_failed);
        },
        (listSessionMeditation) {
          emit(AddSessionMeditationLoadedState(listSessionMeditation));
          event.onSuccess.call();
        },
      );
    });
  }

  @override
  Future<void> close() {
    GetIt.I<SessionMeditationBloc>().close();
    return super.close();
  }
}
