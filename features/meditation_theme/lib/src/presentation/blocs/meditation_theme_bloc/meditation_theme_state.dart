import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/src/data/models/meditation_theme_dto.dart';
import 'package:uuid/uuid.dart';

abstract class MeditationThemeState extends Equatable {
  const MeditationThemeState();
}

class MeditationThemeInitial extends MeditationThemeState {
  @override
  List<Object> get props => [];
}

class MeditationThemeLoadedState extends MeditationThemeState {
  final List<MeditationThemeDTO> listMeditationThemeDTO;

  const MeditationThemeLoadedState(
    this.listMeditationThemeDTO,
  );

  // Add Uuid().v4() to update state when emit.
  @override
  List<Object> get props => [...listMeditationThemeDTO, const Uuid().v4()];
}
