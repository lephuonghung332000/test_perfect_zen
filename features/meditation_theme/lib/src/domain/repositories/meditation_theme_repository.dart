import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../meditation_theme.dart';

abstract class MeditationThemeRepository {
  Future<Either<Failure, List<MeditationThemeDTO>>> getListMeditationThemeDTO(
      NoParams params);
  Future<Either<Failure, List<MeditationThemeDTO>>> createMeditationThemeDTO({
    required String name,
    int? duration,
    IntervalBellDTO? intervalBellDTO,
    MainMusicDTO? mainMusicDTO,
    AmbientSoundsDTO? ambientSoundsDTO,
    bool? isPremium,
    DateTime? createdAt,
  });
  Future<Either<Failure, List<MusicDTO>>> getListMusicDTO({
    MusicDtoTypes? type,
  });

  Future<Either<Failure, List<MeditationThemeDTO>>> editMeditationThemeDTO({
    required EditMeditationThemeParams params,
  });

  Future<Either<Failure, List<MusicDTO>>> updateMusicDTO({
    required UpdateMusicParams params,
  });
  Future<Either<Failure, List<SessionDurationDTO>>> getListSessionMeditation(
      NoParams params);
  Future<Either<Failure, List<SessionDurationDTO>>> addSessionMeditation(
      int duration);

  Future<Either<Failure, List<MeditationThemeDTO>>> deleteMeditationThemeDTO({
    required MeditationThemeDTO theme,
  });

  Future<Either<Failure, int>> getTimeSession();
  Future<Either<Failure, void>> addMusicDTO(
      {required String name,
      required String filePath,
      required MusicDtoTypes type});
}
