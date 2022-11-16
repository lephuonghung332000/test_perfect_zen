import 'package:dependencies/dependencies.dart';
import 'package:json_annotation/json_annotation.dart';

import 'music_dto.dart';
part 'main_music_dto.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class MainMusicDTO extends Equatable {
  MainMusicDTO({
    required this.volume,
    required this.musicDTO,
  });

  @HiveField(20)
  @JsonKey(name: 'main_music_dto_volume', required: true)
  late double volume;

  @HiveField(21)
  @JsonKey(name: 'main_music_dto', required: true)
  late MusicDTO musicDTO;

  factory MainMusicDTO.fromJson(Map<String, dynamic> json) => MainMusicDTO(
        volume: json['volume'],
        musicDTO: json['musicDTO'],
      );

  @override
  List<Object?> get props => [
        volume,
        musicDTO,
      ];
}
