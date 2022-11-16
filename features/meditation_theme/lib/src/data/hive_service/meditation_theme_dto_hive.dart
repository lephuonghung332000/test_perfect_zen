import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

class MeditationThemeDTOHive {
  void meditationThemeDTOHive() {}
  static Future<int> addMeditationThemeDTO({
    required String name,
    required int duration,
    IntervalBellDTO? intervalBellDTO,
    required MainMusicDTO mainMusicDTO,
    required AmbientSoundsDTO ambientSoundsDTO,
    required bool isPremium,
    required DateTime createdAt,
    required DateTime updatedAt,
    bool? isDefault,
  }) async {
    final box = Boxes.getListMeditationThemeDTO();
    if (box.values.isEmpty) {
      return _addMeditationTheme(
        name: name,
        duration: duration,
        intervalBellDTO: intervalBellDTO,
        mainMusicDTO: mainMusicDTO,
        ambientSoundsDTO: ambientSoundsDTO,
        isPremium: isPremium,
        box: box,
        createdAt: createdAt,
        updatedAt: updatedAt,
        isDefault: isDefault,
      );
    } else {
      bool isExist = box.values
          .where(
            (element) =>
                element.name == name &&
                element.duration == duration &&
                element.isPremium == isPremium &&
                element.intervalBellDTO == intervalBellDTO &&
                element.mainMusicDTO == mainMusicDTO &&
                element.ambientSoundsDTO == ambientSoundsDTO,
          )
          .toList()
          .isNotEmpty;
      if (!isExist) {
        return _addMeditationTheme(
          name: name,
          duration: duration,
          intervalBellDTO: intervalBellDTO,
          mainMusicDTO: mainMusicDTO,
          ambientSoundsDTO: ambientSoundsDTO,
          isPremium: isPremium,
          box: box,
          createdAt: createdAt,
          updatedAt: updatedAt,
          isDefault: isDefault,
        );
      }
    }

    return -1;
  }

  static int _addMeditationTheme({
    required String name,
    required int duration,
    IntervalBellDTO? intervalBellDTO,
    required MainMusicDTO mainMusicDTO,
    required AmbientSoundsDTO ambientSoundsDTO,
    required bool isPremium,
    required Box<MeditationThemeDTO> box,
    required DateTime createdAt,
    required DateTime updatedAt,
    bool? isDefault,
  }) {
    final meditationThemeFile = MeditationThemeDTO(
      name: name,
      duration: duration,
      intervalBellDTO: intervalBellDTO,
      mainMusicDTO: mainMusicDTO,
      ambientSoundsDTO: ambientSoundsDTO,
      isPremium: isPremium,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isDefault: isDefault ?? false,
    );
    box.add(meditationThemeFile);
    return box.values.toList().indexOf(meditationThemeFile);
  }
}
