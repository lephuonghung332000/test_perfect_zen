import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/src/data/models/meditation_theme_dto.dart';

abstract class CreateMeditationThemeState extends Equatable {
  const CreateMeditationThemeState();
}

class CreateMeditationThemeInitial extends CreateMeditationThemeState {
  @override
  List<Object> get props => [];
}

class CreateMeditationThemeLoadedState extends CreateMeditationThemeState {
  final List<MeditationThemeDTO> listMeditationThemeDTO;

  const CreateMeditationThemeLoadedState(
    this.listMeditationThemeDTO,
  );

  @override
  List<Object> get props => [listMeditationThemeDTO.length];
}
