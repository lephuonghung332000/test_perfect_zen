import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

class ThemeDuration extends StatefulWidget {
  const ThemeDuration({
    Key? key,
    required this.onChanged,
    this.initialValue,
  }) : super(key: key);

  final Function(double) onChanged;
  final double? initialValue;

  @override
  State<ThemeDuration> createState() => _ThemeDurationState();
}

class _ThemeDurationState extends State<ThemeDuration> {
  late double volumeValue;

  @override
  void initState() {
    super.initState();
    volumeValue = widget.initialValue ?? 15.0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.duration,
          style: CustomTextStyle.TITLE_16_BLACK,
        ),
        const SizedBox(
          height: 20,
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            overlayShape: SliderComponentShape.noOverlay,
            trackHeight: 3,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
          ),
          child: Slider(
            divisions: 59,
            max: 60.0,
            min: 1.0,
            inactiveColor: Colors.white,
            activeColor: StaticColors.active_duration,
            label: S.current.mins(volumeValue.toInt().toString()),
            onChanged: (value) {
              setState(() {
                volumeValue = value;
                widget.onChanged.call(volumeValue);
              });
            },
            value: volumeValue,
          ),
        )
      ],
    );
  }
}
