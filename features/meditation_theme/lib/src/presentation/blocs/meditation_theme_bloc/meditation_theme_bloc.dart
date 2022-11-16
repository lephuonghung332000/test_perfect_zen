import 'package:component/atom/toast.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';

class MeditationThemeBloc
    extends Bloc<MeditationThemeEvent, MeditationThemeState> {
  final GetListMeditationThemeUseCase getListMeditationThemeUseCase;

  MeditationThemeBloc({
    required this.getListMeditationThemeUseCase,
  }) : super(MeditationThemeInitial()) {
    on<LoadMeditationThemeEvent>((event, emit) async {
      final result = await getListMeditationThemeUseCase(NoParams());
      result.fold(
        (failure) {
          Toast.show(message: S.current.get_list_meditation_theme_failed);
        },
        (listMeditationThemeDTO) {
          emit(MeditationThemeLoadedState(listMeditationThemeDTO));
        },
      );
    });
  }

  @override
  Future<void> close() async {
    // dispose
    GetIt.I<MeditationThemeBloc>().close();
    super.close();
  }
}
