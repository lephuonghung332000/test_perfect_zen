import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

class AmbientSoundsDTOHive {
  void ambientSoundsDTOHive() {}
  static Future<int> addAmbientSoundsDTO({
    required double volume,
    required List<MusicDTO> listMusicDTO,
  }) async {
    final box = Boxes.getListAmbientSoundsDTO();
    if (box.values.isEmpty) {
      return _addAmbientSound(
        volume: volume,
        listMusicDTO: listMusicDTO,
        box: box,
      );
    } else {
      bool isExist = box.values
          .where(
            (element) => element.volume == volume && element.listMusicDTO == listMusicDTO,
          )
          .toList()
          .isNotEmpty;

      if (!isExist) {
        return _addAmbientSound(
          volume: volume,
          listMusicDTO: listMusicDTO,
          box: box,
        );
      }
    }
    return -1;
  }

  static _addAmbientSound({
    required double volume,
    required List<MusicDTO> listMusicDTO,
    required Box<AmbientSoundsDTO> box,
  }) {
    final ambientSoundsFile = AmbientSoundsDTO(
      volume: volume,
      listMusicDTO: listMusicDTO,
    );
    box.add(ambientSoundsFile);
    return box.values.toList().indexOf(ambientSoundsFile);
  }
}
