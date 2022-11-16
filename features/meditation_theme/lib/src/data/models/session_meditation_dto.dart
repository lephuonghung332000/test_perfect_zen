import 'package:dependencies/dependencies.dart';
import 'package:json_annotation/json_annotation.dart';
part 'session_meditation_dto.g.dart';

@HiveType(typeId: 11)
@JsonSerializable()
class SessionDurationDTO extends Equatable {
  SessionDurationDTO({
    required this.createdAt,
    required this.duration,
  });

  @HiveField(110)
  @JsonKey(name: 'createdAt', required: true)
  late DateTime createdAt;

  @HiveField(111)
  @JsonKey(name: 'duration', required: true)
  late int duration;

  factory SessionDurationDTO.fromJson(Map<String, dynamic> json) => SessionDurationDTO(
        createdAt: json['createdAt'],
        duration: json['duration'],
      );

  List<Object?> get props => [
        createdAt,
        duration,
      ];
}
