import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

abstract class DeleteMeditationThemeEvent extends Equatable {
  const DeleteMeditationThemeEvent();
}

class DeleteThemeEvent extends DeleteMeditationThemeEvent {
  final MeditationThemeDTO theme;
  final Function onSuccess;
  const DeleteThemeEvent({
    required this.theme,
    required this.onSuccess,
  });

  @override
  List<Object?> get props => [
        theme,
        onSuccess,
      ];
}
