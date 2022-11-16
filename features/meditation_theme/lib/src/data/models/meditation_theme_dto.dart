import 'package:dependencies/dependencies.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ambient_sounds_dto.dart';
import 'interval_bell_dto.dart';
import 'main_music_dto.dart';
part 'meditation_theme_dto.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class MeditationThemeDTO extends Equatable {
  MeditationThemeDTO({
    required this.name,
    required this.duration,
    this.intervalBellDTO,
    this.mainMusicDTO,
    this.ambientSoundsDTO,
    required this.isPremium,
    required this.createdAt,
    required this.updatedAt,
    required this.isDefault,
  });

  @HiveField(40)
  @JsonKey(name: 'meditation_theme_dto_name', required: true)
  late String name;

  @HiveField(41)
  @JsonKey(name: 'meditation_theme_dto_duration', required: true)
  late int duration;

  @HiveField(42)
  @JsonKey(name: 'meditation_theme_dto_interval_bell_dto', required: false)
  late IntervalBellDTO? intervalBellDTO;

  @HiveField(43)
  @JsonKey(name: 'meditation_theme_dto_main_music_dto', required: false)
  late MainMusicDTO? mainMusicDTO;

  @HiveField(44)
  @JsonKey(name: 'meditation_theme_dto_ambient_sounds_dto', required: false)
  late AmbientSoundsDTO? ambientSoundsDTO;

  @HiveField(45)
  @JsonKey(name: 'meditation_theme_dto_is_premium', required: true)
  late bool isPremium;

  @HiveField(46)
  @JsonKey(name: 'meditation_theme_dto_created_at', required: true)
  late DateTime createdAt;

  @HiveField(47)
  @JsonKey(name: 'meditation_theme_dto_updatedAt', required: true)
  late DateTime updatedAt;

  @HiveField(48)
  @JsonKey(name: 'meditation_theme_dto_is_default', required: true)
  late bool isDefault;

  factory MeditationThemeDTO.fromJson(Map<String, dynamic> json) =>
      MeditationThemeDTO(
        name: json['name'],
        duration: json['duration'],
        intervalBellDTO: json['intervalBellDTO'],
        mainMusicDTO: json['mainMusicDTO'],
        ambientSoundsDTO: json['ambientSoundsDTO'],
        isPremium: json['isPremium'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        isDefault: json['isDefault'],
      );
  @override
  List<Object?> get props => [
        name,
        duration,
        intervalBellDTO,
        mainMusicDTO,
        ambientSoundsDTO,
        isPremium,
        createdAt,
        updatedAt,
        isDefault
      ];
}
