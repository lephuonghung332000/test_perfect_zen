import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

abstract class CreateMeditationThemeDTOEvent extends Equatable {
  const CreateMeditationThemeDTOEvent();
}

class CreateMeditationThemeEvent extends CreateMeditationThemeDTOEvent {
  final MeditationThemeDTO meditationThemeDTO;
  final Function onSuccess;
  const CreateMeditationThemeEvent({
    required this.meditationThemeDTO,
    required this.onSuccess,
  });

  @override
  List<Object?> get props => [
        meditationThemeDTO,
        onSuccess,
      ];
}
