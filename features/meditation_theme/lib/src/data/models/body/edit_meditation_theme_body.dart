import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meditation_theme/meditation_theme.dart';

@HiveType(typeId: 6)
@JsonSerializable()
class EditMeditationThemeBody extends Equatable {
  EditMeditationThemeBody({
    Key? key,
    required this.editedMeditationThemeDTO,
    required this.originalMeditationThemeDTO,
  });

  @HiveField(30)
  @JsonKey(
      name: 'EditMeditationThemeBody_editedMeditationThemeDTO', required: true)
  late MeditationThemeDTO editedMeditationThemeDTO;

  @HiveField(31)
  @JsonKey(name: 'EditMeditationThemeBody_index', required: true)
  late MeditationThemeDTO originalMeditationThemeDTO;

  factory EditMeditationThemeBody.fromJson(Map<String, dynamic> json) =>
      EditMeditationThemeBody(
        editedMeditationThemeDTO: json['editedMeditationThemeDTO'],
        originalMeditationThemeDTO: json['originalMeditationThemeDTO'],
      );

  @override
  List<Object?> get props => [
        editedMeditationThemeDTO,
        originalMeditationThemeDTO,
      ];
}
