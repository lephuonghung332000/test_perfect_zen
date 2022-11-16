import 'package:flutter/material.dart';
import 'package:meditation_theme/meditation_theme.dart';

class IntervalBellBody extends StatefulWidget {
  final Function(IntervalBellDTO?) onSelectMusic;
  final IntervalBellDTO? initialValue;
  const IntervalBellBody({
    Key? key,
    required this.onSelectMusic,
    this.initialValue,
  }) : super(key: key);

  @override
  State<IntervalBellBody> createState() => _IntervalBellBodyState();
}

class _IntervalBellBodyState extends State<IntervalBellBody> {
  MusicDTO? intervalBellMusicDTO;
  int? intervalBellDuration;
  double? intervalBellVolume;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      intervalBellMusicDTO = widget.initialValue!.musicDTO;
      intervalBellDuration = widget.initialValue!.duration;
      intervalBellVolume = widget.initialValue!.volume;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntervalBellSound(
          onVolumeChange: (volume) {
            setState(() {
              intervalBellVolume = volume;

              if (intervalBellMusicDTO != null) {
                widget.onSelectMusic.call(IntervalBellDTO(
                  musicDTO: intervalBellMusicDTO!,
                  duration: intervalBellDuration ?? 4,
                  volume: intervalBellVolume ?? 5,
                ));
              }
            });
          },
          initialValue: widget.initialValue,
          onSelectIntervalBell: (music, duration) {
            setState(() {
              intervalBellMusicDTO = music;
              if (duration != null) intervalBellDuration = duration;

              widget.onSelectMusic.call(intervalBellMusicDTO == null
                  ? null
                  : IntervalBellDTO(
                      musicDTO: intervalBellMusicDTO!,
                      duration: intervalBellDuration ?? 4,
                      volume: intervalBellVolume ?? 5,
                    ));
            });
          },
        ),
      ],
    );
  }
}
