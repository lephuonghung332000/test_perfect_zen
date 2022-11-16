import 'package:dependencies/dependencies.dart';

abstract class MusicPlayerState extends Equatable {}

class InitialState extends MusicPlayerState {
  @override
  List<Object?> get props => [];
}

class PlayingState extends MusicPlayerState {
  @override
  List<Object?> get props => [];
}

class PausingState extends MusicPlayerState {
  @override
  List<Object?> get props => [];
}

class RefreshState extends MusicPlayerState {
  @override
  List<Object?> get props => [];
}

class UpdateProgressState extends MusicPlayerState {
  final Duration duration;
  final Duration position;
  UpdateProgressState({required this.duration, required this.position});
  @override
  List<Object?> get props => [duration, position];
}
