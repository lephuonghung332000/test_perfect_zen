import 'package:bloc/bloc.dart';
import 'package:component/atom/toast.dart';
import 'package:dependencies/dependencies.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';

class EditMeditationThemeBloc
    extends Bloc<EditMeditationThemeEvent, EditMeditationThemeState> {
  final EditMeditationThemeUseCase editMeditationThemeUseCase;

  EditMeditationThemeBloc({
    required this.editMeditationThemeUseCase,
  }) : super(EditMeditationThemeInitial()) {
    on<EditMeditationThemeEvent>((event, emit) async {
      final result = await editMeditationThemeUseCase(
        EditMeditationThemeParams(
          data: EditMeditationThemeBody(
            originalMeditationThemeDTO: event.originalMeditationThemeDTO,
            editedMeditationThemeDTO: event.editedMeditationThemeDTO,
          ),
        ),
      );
      result.fold(
        (failure) {
          Toast.show(message: S.current.edit_meditation_theme_failed);
        },
        (listMeditationThemeDTO) {
          emit(EditMeditationThemeLoadedState(listMeditationThemeDTO));
          event.onSuccess.call();
        },
      );
    });
  }
}
