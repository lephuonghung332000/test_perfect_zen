import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

abstract class EditMeditationThemeDTOEvent extends Equatable {
  const EditMeditationThemeDTOEvent();
}

class EditMeditationThemeEvent extends EditMeditationThemeDTOEvent {
  final MeditationThemeDTO editedMeditationThemeDTO;
  final MeditationThemeDTO originalMeditationThemeDTO;
  final Function onSuccess;
  const EditMeditationThemeEvent({
    required this.editedMeditationThemeDTO,
    required this.onSuccess,
    required this.originalMeditationThemeDTO,
  });

  @override
  List<Object?> get props => [
        editedMeditationThemeDTO,
        onSuccess,
        originalMeditationThemeDTO,
      ];
}
