import 'package:bloc/bloc.dart';
import 'package:component/atom/toast.dart';
import 'package:dependencies/dependencies.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';

import 'create_meditation_theme_event.dart';
import 'create_meditation_theme_state.dart';

class CreateMeditationThemeBloc
    extends Bloc<CreateMeditationThemeEvent, CreateMeditationThemeState> {
  final CreateMeditationThemeUseCase createMeditationThemeUseCase;

  CreateMeditationThemeBloc({
    required this.createMeditationThemeUseCase,
  }) : super(CreateMeditationThemeInitial()) {
    on<CreateMeditationThemeEvent>((event, emit) async {
      final result = await createMeditationThemeUseCase(event.meditationThemeDTO);
      result.fold(
        (failure) {
          Toast.show(message: S.current.create_meditation_theme_failed);
        },
        (listMeditationThemeDTO) {
          emit(CreateMeditationThemeLoadedState(listMeditationThemeDTO));
          event.onSuccess.call();
        },
      );
    });
  }
}
