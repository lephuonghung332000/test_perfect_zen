import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class MusicPlayerProgressBar extends StatelessWidget {
  final Duration position;
  final Duration duration;

  double get progress {
    if (duration.inMilliseconds <= 0) {
      return 0;
    }

    return position.inMilliseconds / duration.inMilliseconds;
  }

  const MusicPlayerProgressBar({
    Key? key,
    required this.duration,
    required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Utils.formatPlayingTime(position),
              style: CustomTextStyle.TITLE_12.apply(
                color: Colors.white,
              ),
            ),
            Text(
              Utils.formatPlayingTime(duration),
              style: CustomTextStyle.TITLE_12.apply(
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        LinearProgressIndicator(
          valueColor: const AlwaysStoppedAnimation<Color>(
            StaticColors.premium_end_gradient,
          ),
          backgroundColor: Colors.white,
          color: Colors.white,
          value: progress,
        ),
      ],
    );
  }
}
