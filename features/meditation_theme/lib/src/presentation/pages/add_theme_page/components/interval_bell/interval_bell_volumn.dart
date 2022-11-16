import 'package:component/atom/custom_slider.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class IntervalBellVolume extends StatefulWidget {
  final Function(double?) onChangedVolume;
  final double? initialValue;
  const IntervalBellVolume({
    Key? key,
    required this.onChangedVolume,
    this.initialValue,
  }) : super(key: key);

  @override
  State<IntervalBellVolume> createState() => _IntervalBellVolumeState();
}

class _IntervalBellVolumeState extends State<IntervalBellVolume> {
  double selectedSoundValue = 5.0;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      selectedSoundValue = widget.initialValue!.toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomSlider(
      value: selectedSoundValue,
      onChanged: (value) {
        setState(() {
          GetIt.I<AnalyticsHelper>().logEvent(CommontAnalyticsEvent(
              EventName.selectMeditationIntervalBellTime));
          selectedSoundValue = value;
          widget.onChangedVolume.call(selectedSoundValue);
        });
      },
    );
  }
}
