import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

class IntervalBellDTOHive {
  void intervalBellDTOHive() {}
  static Future<int> addIntervalBellDTO({
    required int duration,
    required double volume,
    required MusicDTO musicDTO,
  }) async {
    final box = Boxes.getListIntervalBellDTO();
    if (box.values.isEmpty) {
      return _addIntervalBell(
        duration: duration,
        volume: volume,
        musicDTO: musicDTO,
        box: box,
      );
    } else {
      bool isExist = box.values
          .where(
            (element) =>
                element.volume == volume &&
                element.duration == duration &&
                element.musicDTO == musicDTO,
          )
          .toList()
          .isNotEmpty;

      if (!isExist) {
        return _addIntervalBell(
          duration: duration,
          volume: volume,
          musicDTO: musicDTO,
          box: box,
        );
      }
    }
    return -1;
  }

  static int _addIntervalBell({
    required int duration,
    required double volume,
    required MusicDTO musicDTO,
    required Box<IntervalBellDTO> box,
  }) {
    final intervalBellDTO = IntervalBellDTO(
      duration: duration,
      volume: volume,
      musicDTO: musicDTO,
    );
    box.add(intervalBellDTO);
    return box.values.toList().indexOf(intervalBellDTO);
  }
}
