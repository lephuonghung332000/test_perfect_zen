import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:uuid/uuid.dart';

class MusicDTOHive {
  void musicDTOHive() {}
  static Future<int> addMusicDTO({
    required String name,
    String? filePath,
    String? assetPath,
    String? iconPath,
    required MusicDtoTypes type,
    String? activeIconPath,
    bool? active,
    String? onlineUrl,
    required bool isAssetFile,
  }) async {
    final box = Boxes.getListMusicDTO();
    if (box.values.isEmpty) {
      return _addMusic(
        name: name,
        assetPath: assetPath,
        filePath: filePath,
        iconPath: iconPath,
        type: type,
        box: box,
        active: active,
        activeIconPath: activeIconPath,
        onlineUrl: onlineUrl,
        isAssetFile: isAssetFile,
      );
    } else {
      bool isExist = box.values
          .where(
            (element) =>
                element.name == name &&
                element.filePath == filePath &&
                element.iconPath == iconPath &&
                element.type == type &&
                element.onlineUrl == onlineUrl,
          )
          .toList()
          .isNotEmpty;

      if (!isExist) {
        return _addMusic(
          name: name,
          assetPath: assetPath,
          filePath: filePath,
          iconPath: iconPath,
          activeIconPath: activeIconPath,
          type: type,
          box: box,
          active: active,
          onlineUrl: onlineUrl,
          isAssetFile: isAssetFile,
        );
      }
    }
    return -1;
  }

  static int _addMusic({
    required String name,
    String? filePath,
    String? assetPath,
    String? iconPath,
    String? activeIconPath,
    required MusicDtoTypes type,
    required Box<MusicDTO> box,
    bool? active,
    String? onlineUrl,
    required bool isAssetFile,
  }) {
    final uuid = const Uuid().v4();
    final musicDTO = MusicDTO(
      name: name,
      filePath: filePath,
      assetPath: assetPath,
      iconPath: iconPath,
      activeIconPath: activeIconPath,
      type: type,
      active: active ?? false,
      onlineUrl: onlineUrl,
      isAssetFile: isAssetFile,
      musicPlayerId: uuid,
    );
    box.add(musicDTO);
    return box.values.toList().indexOf(musicDTO);
  }

  static List<MusicDTO> getListMusicDtoByType({
    required MusicDtoTypes? type,
  }) {
    List<MusicDTO> listMusicDTO = [];
    final box = Boxes.getListMusicDTO();
    if (type == null) {
      listMusicDTO = box.values.toList();
    } else {
      listMusicDTO = box.values
          .where(
            (element) => element.type == type,
          )
          .toList();
    }
    return listMusicDTO;
  }
}
