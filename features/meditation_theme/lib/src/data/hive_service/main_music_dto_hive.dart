import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

class MainMusicDTOHive {
  void mainMusicDTOHive() {}
  static Future<int> addMainMusicDTO({
    required double volume,
    required MusicDTO musicDTO,
  }) async {
    final box = Boxes.getListMainMusicDTO();
    if (box.values.isEmpty) {
      return _addMainMusic(
        volume: volume,
        musicDTO: musicDTO,
        box: box,
      );
    } else {
      bool isExist = box.values
          .where(
            (element) => element.volume == volume && element.musicDTO == musicDTO,
          )
          .toList()
          .isNotEmpty;
      if (!isExist) {
        return _addMainMusic(
          volume: volume,
          musicDTO: musicDTO,
          box: box,
        );
      }
    }

    return -1;
  }

  static int _addMainMusic({
    required double volume,
    required MusicDTO musicDTO,
    required Box<MainMusicDTO> box,
  }) {
    final mainMusicDTO = MainMusicDTO(
      volume: volume,
      musicDTO: musicDTO,
    );
    box.add(mainMusicDTO);
    return box.values.toList().indexOf(mainMusicDTO);
  }
}
