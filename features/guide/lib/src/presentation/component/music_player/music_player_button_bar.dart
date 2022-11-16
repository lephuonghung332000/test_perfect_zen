import 'package:component/atom/player_button.dart';
import 'package:flutter/material.dart';

class MusicPlayerButtonBar extends StatelessWidget {
  final VoidCallback? onRefresh;
  final VoidCallback? onPlay;
  final VoidCallback? onPause;
  final bool isPlaying;
  const MusicPlayerButtonBar({
    Key? key,
    this.onRefresh,
    this.onPause,
    this.onPlay,
    this.isPlaying = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PlayerButton(
          icon: Icons.refresh,
          onClicked: onRefresh,
        ),
        const SizedBox(
          width: 24,
        ),
        PlayerButton(
          icon: isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
          onClicked: isPlaying ? onPause : onPlay,
        ),
      ],
    );
  }
}
