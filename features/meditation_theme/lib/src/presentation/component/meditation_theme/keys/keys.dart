import 'package:flutter/material.dart';

abstract class MeditationKey {
  static get meditationButtonAddTimerKey =>
      const Key('meditationButtonAddTimerKey');
  static get meditationTitleTimerKey => const Key('meditationTitleTimerKey');

  static get meditationDropDownTimerKey =>
      const Key('meditationDropDownTimerKey');

  static get meditationSaveTimerKey =>
      const Key('meditationButtonSaveTimerKey');

  static get meditationSaveMusicTimerKey =>
      const Key('meditationSaveMusicTimerKey');
}
