import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meditation_theme/meditation_theme.dart';

@HiveType(typeId: 8)
@JsonSerializable()
class UpdateMusicBody extends Equatable {
  UpdateMusicBody({
    Key? key,
    required this.musicPath,
    required this.originalMusicDTO,
  });

  @HiveField(80)
  @JsonKey(name: 'UpdateMusicBody_musicPath', required: true)
  late String musicPath;

  @HiveField(81)
  @JsonKey(name: 'UpdateMusicBody_originalMusicDTO', required: true)
  late MusicDTO originalMusicDTO;

  factory UpdateMusicBody.fromJson(Map<String, dynamic> json) =>
      UpdateMusicBody(
        musicPath: json['musicPath'],
        originalMusicDTO: json['originalMusicDTO'],
      );

  @override
  List<Object?> get props => [
        musicPath,
        originalMusicDTO,
      ];
}
