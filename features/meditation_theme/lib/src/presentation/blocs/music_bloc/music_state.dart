import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

abstract class MusicState extends Equatable {
  const MusicState();
}

class MusicInitial extends MusicState {
  @override
  List<Object> get props => [];
}

class MusicLoadedState extends MusicState {
  final List<MusicDTO> listMusicDTO;

  const MusicLoadedState(
    this.listMusicDTO,
  );

  @override
  List<Object?> get props => [
        listMusicDTO,
      ];
}
