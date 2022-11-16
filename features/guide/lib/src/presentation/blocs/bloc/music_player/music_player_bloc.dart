import 'dart:async';

import 'package:dependencies/dependencies.dart';

import 'music_player_event.dart';
import 'music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  final audioPlayer = AudioPlayer();
  final String url;
  Duration _duration = const Duration();
  Duration _position = const Duration();

  StreamSubscription<Duration>? onPositionChanged, onDurationChanged;
  StreamSubscription<void>? onPlayerComplete;
  bool mounted = true;

  MusicPlayerBloc({required this.url}) : super(InitialState()) {
    on<PlayEvent>(
      (event, emit) async {
        if (_duration == Duration.zero) {
          return;
        }
        await audioPlayer.resume();
      },
    );

    on<PauseEvent>(
      (event, emit) async {
        if (_duration == Duration.zero) {
          return;
        }
        await audioPlayer.pause();
      },
    );

    on<RefreshEvent>(
      (event, emit) async {
        if (_duration == Duration.zero) {
          return;
        }
        await audioPlayer.seek(Duration.zero);
        await audioPlayer.stop();
      },
    );

    on<UpdatePlayerStateEvent>(
      ((event, emit) {
        switch (event.state) {
          case PlayerState.stopped:
          case PlayerState.paused:
          case PlayerState.completed:
            emit(PausingState());
            break;
          case PlayerState.playing:
            emit(PlayingState());
            break;
        }
      }),
    );

    on<UpdatePositionChangedEvent>(
      ((event, emit) {
        emit(
          UpdateProgressState(duration: _duration, position: _position),
        );
      }),
    );

    on<UpdateDurationChangedEvent>(
      ((event, emit) {
        emit(
          UpdateProgressState(duration: _duration, position: _position),
        );
      }),
    );

    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if (!mounted) {
        return;
      }

      switch (playerState) {
        case PlayerState.stopped:
        case PlayerState.paused:
        case PlayerState.completed:
          add(UpdatePlayerStateEvent(state: PlayerState.paused));
          break;
        case PlayerState.playing:
          add(UpdatePlayerStateEvent(state: PlayerState.playing));
          break;
      }
    });

    onPositionChanged = audioPlayer.onPositionChanged.listen(
      (duration) {
        _position = duration;
        add(UpdatePositionChangedEvent(
            duration: _duration, position: _position));
      },
    );

    onDurationChanged = audioPlayer.onDurationChanged.listen(
      (duration) {
        _duration = duration;
        add(UpdateDurationChangedEvent(
            duration: _duration, position: _position));
      },
    );

    onPlayerComplete = audioPlayer.onPlayerComplete.listen((_) {
      add(UpdatePlayerStateEvent(state: PlayerState.paused));
    });

    audioPlayer.setSource(UrlSource(url)).then((value) {
      add(UpdatePlayerStateEvent(state: PlayerState.playing));
    });
  }

  @override
  Future<void> close() {
    mounted = false;
    audioPlayer.stop();
    onDurationChanged?.cancel();
    onPositionChanged?.cancel();
    return super.close();
  }
}
