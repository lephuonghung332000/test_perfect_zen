import 'package:bloc/bloc.dart';
import 'package:component/atom/toast.dart';
import 'package:dependencies/dependencies.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';

class DeleteMeditationThemeBloc extends Bloc<DeleteMeditationThemeEvent, void> {
  final DeleteMeditationThemeUseCase deleteMeditationThemeUseCase;

  DeleteMeditationThemeBloc({
    required this.deleteMeditationThemeUseCase,
  }) : super(null) {
    on<DeleteThemeEvent>((event, emit) async {
      String name = event.theme.name;
      final result = await deleteMeditationThemeUseCase(event.theme);

      result.fold(
        (failure) {
          Toast.show(message: S.current.delete_meditation_theme_failed);
        },
        (listMeditationThemeDTO) {
          event.onSuccess.call();
          Toast.show(message: '${S.current.theme} $name ${S.current.deleted}');
        },
      );
    });
  }
}
