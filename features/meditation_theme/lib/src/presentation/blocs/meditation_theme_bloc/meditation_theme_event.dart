import 'package:dependencies/dependencies.dart';

abstract class MeditationThemeEvent extends Equatable {
  const MeditationThemeEvent();
}

class LoadMeditationThemeEvent extends MeditationThemeEvent {
  const LoadMeditationThemeEvent();

  @override
  List<Object?> get props => [];
}
