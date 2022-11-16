import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

import 'countdown_body.dart';

class TimerComponent extends StatelessWidget {
  final double valueTimer;
  final int currentSecond;
  final PlayMusicStep currentStep;
  const TimerComponent({
    super.key,
    required this.valueTimer,
    required this.currentStep,
    required this.currentSecond,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(right: 150, top: 0, child: _rectangleVertical()),
          Positioned(right: 150, bottom: 0, child: _rectangleVertical()),
          Positioned(top: 150, right: 0, child: _rectangleHorizontal()),
          Positioned(bottom: 150, left: 0, child: _rectangleHorizontal()),
          CircularProgressIndicator(
            value: valueTimer,
            strokeWidth: 8,
            valueColor:
                const AlwaysStoppedAnimation(StaticColors.inside_ellipse),
            backgroundColor: StaticColors.disable_color,
          ),
          Center(child: _buildTime())
        ],
      ),
    );
  }

  Widget _rectangleVertical() {
    return Container(
      width: 2,
      height: 16,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }

  Widget _rectangleHorizontal() {
    return Container(
      width: 16,
      height: 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }

  Widget _buildTime() {
    if (currentStep == PlayMusicStep.pausePreparing ||
        currentStep == PlayMusicStep.pauseRunning) {
      return Text(
        S.current.paused,
        style: CustomTextStyle.BODY_36,
      );
    }

    return Text(
        currentStep == PlayMusicStep.preparing
            ? currentSecond.toString()
            : displayTime,
        style: currentStep == PlayMusicStep.preparing
            ? CustomTextStyle.BODY_64
            : CustomTextStyle.WHITE_HEADER_46);
  }

  String get displayTime {
    final minutes = currentSecond ~/ 60;
    final second = currentSecond - minutes * 60;

    return '${minutes > 9 ? minutes : '0$minutes'} : ${second > 9 ? second : '0$second'}';
  }
}
