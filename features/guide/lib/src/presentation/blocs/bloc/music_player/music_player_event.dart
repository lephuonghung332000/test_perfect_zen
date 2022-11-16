import 'package:dependencies/dependencies.dart';

abstract class MusicPlayerEvent extends Equatable {}

class StartEvent extends MusicPlayerEvent {
  final String url;
  StartEvent({required this.url});
  @override
  List<Object?> get props => [url];
}

class PlayEvent extends MusicPlayerEvent {
  @override
  List<Object?> get props => [];
}

class PauseEvent extends MusicPlayerEvent {
  @override
  List<Object?> get props => [];
}

class RefreshEvent extends MusicPlayerEvent {
  @override
  List<Object?> get props => [];
}

class UpdatePlayerStateEvent extends MusicPlayerEvent {
  final PlayerState state;

  UpdatePlayerStateEvent({required this.state});

  @override
  List<Object?> get props => [state];
}

class UpdatePositionChangedEvent extends MusicPlayerEvent {
  final Duration duration;
  final Duration position;
  UpdatePositionChangedEvent({required this.duration, required this.position});

  @override
  List<Object?> get props => [duration, position];
}

class UpdateDurationChangedEvent extends MusicPlayerEvent {
  final Duration duration;
  final Duration position;
  UpdateDurationChangedEvent({required this.duration, required this.position});

  @override
  List<Object?> get props => [duration, position];
}
