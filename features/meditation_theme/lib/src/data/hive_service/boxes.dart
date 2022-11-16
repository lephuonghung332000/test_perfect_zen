import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meditation_theme/meditation_theme.dart';

class Boxes {
  void box() {}
  static Box<AmbientSoundsDTO> getListAmbientSoundsDTO() =>
      Hive.box<AmbientSoundsDTO>('ambientSoundsDTO');

  static Box<IntervalBellDTO> getListIntervalBellDTO() =>
      Hive.box<IntervalBellDTO>('intervalBellDTO');

  static Box<MainMusicDTO> getListMainMusicDTO() => Hive.box<MainMusicDTO>('mainMusicDTO');

  static Box<MeditationThemeDTO> getListMeditationThemeDTO() =>
      Hive.box<MeditationThemeDTO>('meditationThemeDTO');

  static Box<MusicDTO> getListMusicDTO() => Hive.box<MusicDTO>('musicDTO');

  static Box<SessionDurationDTO> getListSessionMeditation() =>
      Hive.box<SessionDurationDTO>('sessionMeditation');
}
