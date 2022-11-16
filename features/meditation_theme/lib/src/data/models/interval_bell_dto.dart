import 'package:dependencies/dependencies.dart';
import 'package:json_annotation/json_annotation.dart';

import 'music_dto.dart';
part 'interval_bell_dto.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class IntervalBellDTO extends Equatable {
  IntervalBellDTO({
    required this.duration,
    required this.volume,
    required this.musicDTO,
  });

  @HiveField(10)
  @JsonKey(name: 'interval_bell_dto_duration', required: true)
  late int duration;

  @HiveField(11)
  @JsonKey(name: 'interval_bell_dto_volume', required: true)
  late double volume;

  @HiveField(12)
  @JsonKey(name: 'interval_bell_dto_music_dto', required: true)
  late MusicDTO musicDTO;

  factory IntervalBellDTO.fromJson(Map<String, dynamic> json) =>
      IntervalBellDTO(
        duration: json['duration'],
        volume: json['volume'],
        musicDTO: json['musicFile'],
      );

  @override
  List<Object?> get props => [
        duration,
        volume,
        musicDTO,
      ];
}
