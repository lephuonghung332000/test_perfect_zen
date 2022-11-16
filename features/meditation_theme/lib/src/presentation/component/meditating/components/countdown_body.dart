import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:component/component.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:preferences/preferences.dart';
import 'package:review_app/review_app.dart';

import 'components.dart';

class CountdownBody extends StatefulWidget {
  final MeditationThemeDTO meditationThemeDTO;
  final int saveDuration;
  const CountdownBody({
    Key? key,
    required this.meditationThemeDTO,
    required this.saveDuration,
  }) : super(key: key);

  @override
  State<CountdownBody> createState() => _CountdownBodyState();
}

enum PlayMusicStep {
  initialPreparing,
  preparing,
  pausePreparing,
  initialRunning,
  running,
  pauseRunning,
}

class _CountdownBodyState extends State<CountdownBody> {
  int preparingMaxSecond = 3;
  late int preparingCurrentSecond;

  late int runningMaxSecond = widget.meditationThemeDTO.duration * 60;
  late int runningCurrentSecond;
  late int durations = (runningMaxSecond - runningCurrentSecond) ~/ 60;
  PlayMusicStep currentStep = PlayMusicStep.preparing;
  Timer? timer;
  bool playMusic = false;

  final intervalBellPlayer = AssetsAudioPlayer.withId('intervalBellPlayer');
  final mainMusicPlayer = AssetsAudioPlayer.withId('mainMusicPlayer');
  final List<AssetsAudioPlayer> listPlayer = [];

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  void dispose() {
    disposeMeditation();

    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerComponent(
              valueTimer: _getValueTimer(),
              currentStep: currentStep,
              currentSecond: _getCurrentSecond(),
            ),
            const SizedBox(height: 80),
            _buildButtons(),
          ],
        ),
      );

  int _getCurrentSecond() {
    switch (currentStep) {
      case (PlayMusicStep.initialPreparing):
        return preparingMaxSecond;

      case (PlayMusicStep.preparing):
        return preparingCurrentSecond;

      case (PlayMusicStep.pausePreparing):
        return preparingCurrentSecond;

      case (PlayMusicStep.initialRunning):
        return runningMaxSecond;

      case (PlayMusicStep.running):
        return runningCurrentSecond;

      case (PlayMusicStep.pauseRunning):
        return runningCurrentSecond;

      default:
        return 0;
    }
  }

  double _getValueTimer() {
    switch (currentStep) {
      case (PlayMusicStep.initialPreparing):
        return 0;

      case (PlayMusicStep.preparing):
        return -1;

      case (PlayMusicStep.pausePreparing):
        return 1 - preparingCurrentSecond / preparingMaxSecond;

      case (PlayMusicStep.initialRunning):
        return 0;

      case (PlayMusicStep.running):
        return 1 - runningCurrentSecond / runningMaxSecond;

      case (PlayMusicStep.pauseRunning):
        return 1 - runningCurrentSecond / runningMaxSecond;

      default:
        return 0;
    }
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _refreshButton(),
        const SizedBox(
          width: 20,
        ),
        _playPauseButton(),
      ],
    );
  }

  Widget _refreshButton() {
    return ButtonWidget(
      onClicked: () {
        _resetCountDown();
      },
      icon: Icons.refresh,
    );
  }

  Widget _playPauseButton() {
    return ButtonWidget(
      onClicked: () {
        switch (currentStep) {
          case (PlayMusicStep.initialPreparing):
            setState(() {
              currentStep = PlayMusicStep.preparing;
            });
            _startCountDown();
            break;

          case (PlayMusicStep.preparing): // stop
            setState(() {
              currentStep = PlayMusicStep.pausePreparing;
            });
            _stopCountDown();
            CustomDialog.showConfirmDialog(
              context: context,
              title: S.current.stop_confirmation,
              body: ConfirmFinishMeditationDialog(
                onDiscarded: () {
                  Navigator.pop(context);
                  setState(() {
                    currentStep = PlayMusicStep.preparing;
                  });
                  _startCountDown();
                },
                onConfirmed: (() => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SurveyPage(
                          durationByMin: durations,
                        ),
                      ),
                    )),
              ),
            );
            break;

          case (PlayMusicStep.pausePreparing):
            setState(() {
              currentStep = PlayMusicStep.preparing;
            });
            _startCountDown();
            break;

          case (PlayMusicStep.initialRunning):
            setState(() {
              currentStep = PlayMusicStep.running;
            });
            _startCountDown();
            break;

          case (PlayMusicStep.running): // stop
            setState(() {
              currentStep = PlayMusicStep.pauseRunning;
            });
            _stopCountDown();
            pauseMeditation();
            CustomDialog.showConfirmDialog(
              context: context,
              title: S.current.stop_confirmation,
              body: ConfirmFinishMeditationDialog(
                onConfirmed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SurveyPage(
                        durationByMin: durations,
                      ),
                    ),
                  );
                },
                onDiscarded: () {
                  Navigator.pop(context);
                  setState(() {
                    currentStep = PlayMusicStep.running;
                  });
                  _startCountDown();
                },
              ),
            );
            break;

          case (PlayMusicStep.pauseRunning):
            setState(() {
              currentStep = PlayMusicStep.running;
            });
            _startCountDown();
            break;

          default:
            break;
        }
      },
      icon: Icons.stop,
    );
  }

  void _startCountDown() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        switch (currentStep) {
          case (PlayMusicStep.preparing):
            if (preparingCurrentSecond > 0) {
              setState(() {
                preparingCurrentSecond--;
              });
            }

            if (preparingCurrentSecond == 0) {
              setState(() {
                currentStep = PlayMusicStep.running;
              });
            }
            return;

          case (PlayMusicStep.pausePreparing):
            return;

          case (PlayMusicStep.pauseRunning):
            resumeMeditation();

            return;

          case (PlayMusicStep.running):
            if (runningCurrentSecond > 0) {
              playMeditation();
              setState(() {
                runningCurrentSecond--;
              });
            }

            if (runningCurrentSecond == 0) {
              _resetCountDown();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SurveyPage(
                    durationByMin: widget.meditationThemeDTO.duration,
                  ),
                ),
              );
            }
            return;

          default:
            return;
        }
      },
    );
  }

  void _resetCountDown() {
    setState(() {
      preparingCurrentSecond = preparingMaxSecond;
      runningCurrentSecond = runningMaxSecond;
      resetMeditation();
    });
  }

  void _stopCountDown() {
    timer?.cancel();
    pauseMeditation();
  }

  void playMeditation() {
    for (final player in listPlayer) {
      player.play();
    }
  }

  void resumeMeditation() {
    for (final player in listPlayer) {
      player.playOrPause();
    }
  }

  void disposeMeditation() {
    for (final player in listPlayer) {
      player.dispose();
    }
  }

  void pauseMeditation() {
    for (final player in listPlayer) {
      player.pause();
    }
  }

  void stopMeditation() {
    for (final player in listPlayer) {
      player.stop();
    }
  }

  void resetMeditation() {
    for (final player in listPlayer) {
      player.seek(const Duration(seconds: 0));
    }

    pauseMeditation();
  }

  void initial() {
    preparingCurrentSecond = preparingMaxSecond;
    runningCurrentSecond = runningMaxSecond;

    // IntervalBell
    if (widget.meditationThemeDTO.intervalBellDTO?.musicDTO.assetPath != null) {
      final intervalBell =
          Audio(widget.meditationThemeDTO.intervalBellDTO!.musicDTO.assetPath!);
      final silent = Audio(
        AssetsPath.silent_1m,
        playSpeed: 1 / widget.meditationThemeDTO.intervalBellDTO!.duration,
      );
      intervalBellPlayer.open(
        Playlist(
          audios: [
            intervalBell,
            silent,
          ],
        ),
        loopMode: LoopMode.playlist,
        autoStart: false,
        volume: widget.meditationThemeDTO.intervalBellDTO!.volume / 100.0,
        respectSilentMode: true,
      );
    }

    if (widget.meditationThemeDTO.mainMusicDTO != null) {
      final musicDTO = widget.meditationThemeDTO.mainMusicDTO!.musicDTO;
      // MainMusic
      mainMusicPlayer.open(
        Playlist(
          audios: [
            if (musicDTO.assetPath != null) Audio(musicDTO.assetPath!),
            if (musicDTO.filePath != null) musicDTO.filePath!.audioFile,
            if (musicDTO.onlineUrl != null) Audio.network(musicDTO.onlineUrl!),
          ],
        ),
        loopMode: LoopMode.playlist,
        autoStart: false,
        volume: widget.meditationThemeDTO.mainMusicDTO!.volume / 100.0,
        respectSilentMode: true,
      );
    }

    if (widget.meditationThemeDTO.ambientSoundsDTO != null) {
      for (final sound
          in widget.meditationThemeDTO.ambientSoundsDTO!.listMusicDTO) {
        if (sound.assetPath != null) {
          final player = AssetsAudioPlayer.withId(sound.musicPlayerId);
          player.open(
            Playlist(
              audios: [Audio(sound.assetPath!)],
            ),
            loopMode: LoopMode.playlist,
            autoStart: false,
            volume: widget.meditationThemeDTO.ambientSoundsDTO!.volume / 100.0,
            respectSilentMode: true,
          );
          listPlayer.add(player);
        }
      }
    }

    if (widget.meditationThemeDTO.intervalBellDTO != null) {
      listPlayer.add(intervalBellPlayer);
    }
    if (widget.meditationThemeDTO.mainMusicDTO != null) {
      listPlayer.add(mainMusicPlayer);
    }

    _startCountDown();
  }
}
