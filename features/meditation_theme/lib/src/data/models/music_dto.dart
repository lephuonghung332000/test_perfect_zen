import 'package:dependencies/dependencies.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meditation_theme/src/data/models/music_dto_types.dart';

part 'music_dto.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class MusicDTO extends Equatable {
  MusicDTO({
    required this.name,
    this.iconPath,
    this.activeIconPath,
    required this.type,
    required this.active,
    required this.isAssetFile,
    required this.musicPlayerId,
    this.filePath,
    this.assetPath,
    this.onlineUrl,
  });

  @HiveField(00)
  @JsonKey(name: 'music_name', required: true)
  late String name;

  @HiveField(01)
  @JsonKey(name: 'music_dto', required: false)
  late String? filePath;

  @HiveField(02)
  @JsonKey(name: 'music_dto_icon', required: false)
  late String? iconPath;

  @HiveField(03)
  @JsonKey(name: 'music_dto_active_icon', required: false)
  late String? activeIconPath;

  @HiveField(04)
  @JsonKey(name: 'music_dto_type', required: true)
  late MusicDtoTypes type;

  @HiveField(05)
  @JsonKey(name: 'music_dto_active', required: true)
  late bool active;

  @HiveField(06)
  @JsonKey(name: 'music_dto_onlineUrl', required: false)
  late String? onlineUrl;

  @HiveField(07)
  @JsonKey(name: 'music_dto_isAssetFile', required: true)
  late bool isAssetFile;

  @HiveField(08)
  @JsonKey(name: 'music_dto_musicPlayerId', required: true)
  late String musicPlayerId;

  @HiveField(09)
  @JsonKey(name: 'music_dto_assetPath', required: false)
  late String? assetPath;

  factory MusicDTO.fromJson(Map<String, dynamic> json) => MusicDTO(
        filePath: json['filePath'],
        assetPath: json['assetPath'],
        name: json['name'],
        iconPath: json['iconPath'],
        activeIconPath: json['activeIconPath'],
        type: json['type'],
        active: json['active'],
        onlineUrl: json['onlineUrl'],
        isAssetFile: json['isAssetFile'],
        musicPlayerId: json['musicPlayerId'],
      );

  @override
  List<Object?> get props => [
        name,
        filePath,
        assetPath,
        iconPath,
        activeIconPath,
        type,
        active,
        onlineUrl,
        isAssetFile,
        musicPlayerId,
      ];
}
