import 'package:dependencies/dependencies.dart';
import 'package:json_annotation/json_annotation.dart';

import 'music_dto.dart';
part 'ambient_sounds_dto.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class AmbientSoundsDTO extends Equatable {
  AmbientSoundsDTO({
    required this.volume,
    required this.listMusicDTO,
  });

  @HiveField(30)
  @JsonKey(name: 'main_music_dto_volume', required: true)
  late double volume;

  @HiveField(31)
  @JsonKey(name: 'main_music_dto', required: true)
  late List<MusicDTO> listMusicDTO;

  factory AmbientSoundsDTO.fromJson(Map<String, dynamic> json) =>
      AmbientSoundsDTO(
        volume: json['volume'],
        listMusicDTO: json['listMusicDTO'],
      );

  @override
  List<Object?> get props => [
        volume,
        listMusicDTO,
      ];
}
