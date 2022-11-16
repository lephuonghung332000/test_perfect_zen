import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/src/data/models/meditation_theme_dto.dart';

abstract class EditMeditationThemeState extends Equatable {
  const EditMeditationThemeState();
}

class EditMeditationThemeInitial extends EditMeditationThemeState {
  @override
  List<Object> get props => [];
}

class EditMeditationThemeLoadedState extends EditMeditationThemeState {
  final List<MeditationThemeDTO> listMeditationThemeDTO;

  const EditMeditationThemeLoadedState(
    this.listMeditationThemeDTO,
  );

  @override
  List<Object> get props => [listMeditationThemeDTO];
}
