import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../meditation_theme.dart';

class MeditationThemeImpl implements MeditationThemeRepository {
  final MeditationThemeLocalDataSource meditationThemeLocalDataSource;

  MeditationThemeImpl({required this.meditationThemeLocalDataSource});

  @override
  Future<Either<Failure, List<MeditationThemeDTO>>> getListMeditationThemeDTO(
      NoParams params) async {
    return await meditationThemeLocalDataSource.getListMeditationThemeDTO(
      NoParams(),
    );
  }

  @override
  Future<Either<Failure, List<MusicDTO>>> getListMusicDTO({
    MusicDtoTypes? type,
  }) async {
    return await meditationThemeLocalDataSource.getListMusicDTO(type: type);
  }

  @override
  Future<Either<Failure, List<MeditationThemeDTO>>> createMeditationThemeDTO({
    required String name,
    int? duration,
    IntervalBellDTO? intervalBellDTO,
    MainMusicDTO? mainMusicDTO,
    AmbientSoundsDTO? ambientSoundsDTO,
    bool? isPremium,
    DateTime? createdAt,
  }) async {
    return await meditationThemeLocalDataSource.createMeditationThemeDTO(
      name: name,
      duration: duration,
      intervalBellDTO: intervalBellDTO,
      mainMusicDTO: mainMusicDTO,
      ambientSoundsDTO: ambientSoundsDTO,
      isPremium: isPremium,
      createdAt: createdAt,
    );
  }

  @override
  Future<Either<Failure, List<MeditationThemeDTO>>> editMeditationThemeDTO({
    required EditMeditationThemeParams params,
  }) async {
    return await meditationThemeLocalDataSource.editMeditationThemeDTO(
        params: params);
  }

  @override
  Future<Either<Failure, List<MeditationThemeDTO>>> deleteMeditationThemeDTO({
    required MeditationThemeDTO theme,
  }) async {
    return await meditationThemeLocalDataSource.deleteMeditationThemeDTO(
        theme: theme);
  }

  @override
  Future<Either<Failure, List<MusicDTO>>> updateMusicDTO({
    required UpdateMusicParams params,
  }) async {
    return await meditationThemeLocalDataSource.updateMusicDTO(params: params);
  }

  @override
  Future<Either<Failure, List<SessionDurationDTO>>> getListSessionMeditation(
      NoParams params) async {
    return await meditationThemeLocalDataSource
        .getListSessionMeditation(params);
  }

  @override
  Future<Either<Failure, List<SessionDurationDTO>>> addSessionMeditation(
      int duration) async {
    return await meditationThemeLocalDataSource.addSessionMeditation(duration);
  }

  @override
  Future<Either<Failure, int>> getTimeSession() async {
    final result = await meditationThemeLocalDataSource
        .getListSessionMeditation(NoParams());

    final meditations = result.getOrElse(() => []);

    final meditationDates = meditations
        .where((element) => element.duration > 0)
        .map((e) => e.createdAt)
        .sorted((a, b) => -1 * a.compareTo(b));

    if (meditationDates.isEmpty) {
      return const Right(0);
    }

    if (meditationDates.length == 1) {
      return const Right(1);
    }

    DateTime dateTemp = meditationDates.first;
    int consecutively = 1;

    for (int index = 1; index < meditationDates.length; index++) {
      final previousDateTemp =
          DateTime(dateTemp.year, dateTemp.month, dateTemp.day - 1);

      if (previousDateTemp.isSameDate(meditationDates[index])) {
        consecutively++;
      } else {
        return Right(consecutively);
      }

      dateTemp = meditationDates[index];
    }

    return Right(consecutively);
  }

  @override
  Future<Either<Failure, void>> addMusicDTO(
      {required String name,
      required String filePath,
      required MusicDtoTypes type}) async {
    return await meditationThemeLocalDataSource.addMusicDTO(
      name: name,
      type: type,
      filePath: filePath,
    );
  }
}

extension DateTimeExt on DateTime {
  bool isSameDate(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }
}
