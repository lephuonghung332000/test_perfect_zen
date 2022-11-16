import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

abstract class MeditationThemeLocalDataSource {
  Future<Either<Failure, List<SessionDurationDTO>>> getListSessionMeditation(
      NoParams params);
  Future<Either<Failure, List<SessionDurationDTO>>> addSessionMeditation(
      int duration);

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
  Future<Either<Failure, List<MeditationThemeDTO>>> deleteMeditationThemeDTO({
    required MeditationThemeDTO theme,
  });

  Future<Either<Failure, void>> addMusicDTO(
      {required String name,
      required String filePath,
      required MusicDtoTypes type});
}

class MeditationThemeLocalDataSourceImpl
    extends MeditationThemeLocalDataSource {
  final MeditationThemeHiveService meditationThemeHiveService;

  MeditationThemeLocalDataSourceImpl(
      {required this.meditationThemeHiveService});

  @override
  Future<Either<Failure, List<SessionDurationDTO>>> getListSessionMeditation(
      NoParams params) async {
    try {
      List<SessionDurationDTO> listSessionMeditationDTO = [];
      final box = Boxes.getListSessionMeditation();

      listSessionMeditationDTO = box.values.toList();

      return Right(listSessionMeditationDTO);
    } on Exception catch (error) {
      return Left(
        LocalStorageFailure(
          exception: error,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<SessionDurationDTO>>> addSessionMeditation(
      int duration) async {
    try {
      List<SessionDurationDTO> listSessionMeditationDTO = [];
      final box = Boxes.getListSessionMeditation();

      listSessionMeditationDTO = box.values.toList();
      final existSessionMeditation = listSessionMeditationDTO.where(
        (element) =>
            DateTime.now().day == element.createdAt.day &&
            DateTime.now().month == element.createdAt.month &&
            DateTime.now().year == element.createdAt.year,
      );

      if (existSessionMeditation.toList().isEmpty) {
        final boxSessionMeditationDTO =
            Hive.box<SessionDurationDTO>('sessionMeditation');

        final sessionMeditation = SessionDurationDTO(
          duration: duration,
          createdAt: DateTime.now(),
        );
        boxSessionMeditationDTO.add(sessionMeditation);

        return Right(boxSessionMeditationDTO.values.toList());
      } else {
        final todaySessionMeditation = existSessionMeditation.toList().last;

        int index = listSessionMeditationDTO.indexOf(todaySessionMeditation);
        todaySessionMeditation.duration =
            todaySessionMeditation.duration + duration;
        box.putAt(index, todaySessionMeditation);
      }

      return Right(box.values.toList());
    } on Exception catch (error) {
      return Left(
        LocalStorageFailure(
          exception: error,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MeditationThemeDTO>>> getListMeditationThemeDTO(
      NoParams params) async {
    try {
      await meditationThemeHiveService.openBoxHive();

      refeshMusic();
      seedDataBase();

      final boxMeditationThemeDTO =
          Hive.box<MeditationThemeDTO>('meditationThemeDTO');
      if (boxMeditationThemeDTO.values
          .toList()
          .cast<MeditationThemeDTO>()
          .isEmpty) {
        final meditationThemeHiveService = MeditationThemeHiveServiceImpl();
        meditationThemeHiveService.seedMeditation();
      }
      List<MeditationThemeDTO> list =
          boxMeditationThemeDTO.values.toList().cast<MeditationThemeDTO>();

      return Right(list);
    } on Exception catch (error) {
      return Left(
        LocalStorageFailure(
          exception: error,
        ),
      );
    }
  }

  void seedDataBase() {
    final boxMusicDTO = Hive.box<MusicDTO>('musicDTO');
    if (boxMusicDTO.values.toList().cast<MusicDTO>().isEmpty) {
      final meditationThemeHiveService = MeditationThemeHiveServiceImpl();
      meditationThemeHiveService.seedMeditation();
    }
  }

  @override
  Future<Either<Failure, List<MusicDTO>>> getListMusicDTO({
    MusicDtoTypes? type,
  }) async {
    try {
      List<MusicDTO> listMusicDTO = [];
      final box = Boxes.getListMusicDTO();
      if (type == null) {
        listMusicDTO = box.values.toList();
      } else {
        listMusicDTO = box.values
            .where(
              (element) => element.type == type,
            )
            .toList();
      }

      refeshMusic();
      return Right(listMusicDTO);
    } on Exception catch (error) {
      return Left(
        LocalStorageFailure(
          exception: error,
        ),
      );
    }
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
    try {
      _openBoxIfNotExist(name: 'meditationThemeDTO');
      final boxMeditationThemeDTO =
          Hive.box<MeditationThemeDTO>('meditationThemeDTO');

      final now = DateTime.now();

      final meditationThemeDTO = MeditationThemeDTO(
        name: name,
        duration: duration ?? 15,
        intervalBellDTO: intervalBellDTO,
        mainMusicDTO: mainMusicDTO,
        ambientSoundsDTO: ambientSoundsDTO,
        isPremium: isPremium ?? false,
        createdAt: createdAt ?? now,
        updatedAt: createdAt ?? now,
        isDefault: false,
      );
      boxMeditationThemeDTO.add(meditationThemeDTO);

      return Right(boxMeditationThemeDTO.values.toList());
    } on Exception catch (error) {
      return Left(
        LocalStorageFailure(
          exception: error,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MeditationThemeDTO>>> editMeditationThemeDTO({
    required EditMeditationThemeParams params,
  }) async {
    try {
      final boxMeditationThemeDTO =
          Hive.box<MeditationThemeDTO>('meditationThemeDTO');
      final index = boxMeditationThemeDTO.values
          .toList()
          .indexOf(params.data.originalMeditationThemeDTO);
      if (index >= 0) {
        boxMeditationThemeDTO.putAt(
          index,
          params.data.editedMeditationThemeDTO,
        );
      }

      return Right(boxMeditationThemeDTO.values.toList());
    } on Exception catch (error) {
      return Left(
        LocalStorageFailure(
          exception: error,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MusicDTO>>> updateMusicDTO({
    required UpdateMusicParams params,
  }) async {
    try {
      final box = Boxes.getListMusicDTO();

      final index = box.values.toList().indexOf(params.data.originalMusicDTO);

      MusicDTO newMusic = params.data.originalMusicDTO;
      newMusic.filePath = params.data.musicPath;
      newMusic.isAssetFile = true;

      final mainMusicDTOBox = Boxes.getListMainMusicDTO();
      for (final mainMusic in mainMusicDTOBox.values.toList()) {
        if (mainMusic.musicDTO.name == params.data.originalMusicDTO.name) {
          final mainMusicIndex =
              mainMusicDTOBox.values.toList().indexOf(mainMusic);
          if (mainMusicIndex >= 0) {
            mainMusic.musicDTO = newMusic;
            mainMusicDTOBox.putAt(
              mainMusicIndex,
              mainMusic,
            );
          }
        }
      }

      final meditationThemesBox = Boxes.getListMeditationThemeDTO();
      for (final theme in meditationThemesBox.values.toList()) {
        if (theme.mainMusicDTO != null) {
          if (theme.mainMusicDTO!.musicDTO.name ==
              params.data.originalMusicDTO.name) {
            final mainMusicIndex =
                meditationThemesBox.values.toList().indexOf(theme);
            if (mainMusicIndex >= 0) {
              theme.mainMusicDTO!.musicDTO = newMusic;
              meditationThemesBox.putAt(
                mainMusicIndex,
                theme,
              );
            }
          }
        }
      }

      if (index >= 0) {
        box.putAt(
          index,
          newMusic,
        );
      }

      return Right(box.values.toList());
    } on Exception catch (error) {
      return Left(
        LocalStorageFailure(
          exception: error,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MeditationThemeDTO>>> deleteMeditationThemeDTO({
    required MeditationThemeDTO theme,
  }) async {
    try {
      final boxMeditationThemeDTO =
          Hive.box<MeditationThemeDTO>('meditationThemeDTO');
      final index = boxMeditationThemeDTO.values.toList().indexOf(theme);
      if (index >= 0) {
        boxMeditationThemeDTO.deleteAt(
          index,
        );
      }

      return Right(boxMeditationThemeDTO.values.toList());
    } on Exception catch (error) {
      return Left(
        LocalStorageFailure(
          exception: error,
        ),
      );
    }
  }

  void _openBoxIfNotExist({required String name}) async {
    final boxExists = await Hive.boxExists(name);
    if (!boxExists) await meditationThemeHiveService.openBoxHive();
  }

  void refeshMusic() {
    final boxMusicDTO = Hive.box<MusicDTO>('musicDTO');
    bool haveActiveMusic = boxMusicDTO.values
        .where((element) => element.active == true)
        .isNotEmpty;
    if (haveActiveMusic) {
      boxMusicDTO.values.forEach((music) {
        if (music.active) {
          final musicPlayer = AssetsAudioPlayer.withId(music.musicPlayerId);
          int index = boxMusicDTO.values.toList().indexOf(music);
          music.active = false;
          musicPlayer.stop();
          boxMusicDTO.putAt(index, music);
        }
      });
    }
  }

  @override
  Future<Either<Failure, void>> addMusicDTO({
    required String name,
    required String filePath,
    required MusicDtoTypes type,
  }) async {
    try {
      await MusicDTOHive.addMusicDTO(
        name: name,
        filePath: filePath,
        type: type,
        isAssetFile: false,
      );

      return const Right(null);
    } on Exception catch (error) {
      return Left(
        LocalStorageFailure(exception: error),
      );
    }
  }
}
