import 'package:dependencies/dependencies.dart';
part 'music_dto_types.g.dart';

@HiveType(typeId: 5)
enum MusicDtoTypes {
  @HiveField(50)
  ambientSound,
  @HiveField(51)
  intervalBell,
  @HiveField(52)
  mainMusic,
}
