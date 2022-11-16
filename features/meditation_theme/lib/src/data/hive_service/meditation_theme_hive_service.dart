import 'package:hive_flutter/hive_flutter.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:preferences/preferences.dart';

abstract class MeditationThemeHiveService {
  Future<void> registerAdapterHive();
  Future<void> openBoxHive();
  void seedMeditation();
}

class MeditationThemeHiveServiceImpl implements MeditationThemeHiveService {
  static Future<MeditationThemeHiveService> getInstance() async {
    final meditationThemeHiveService = MeditationThemeHiveServiceImpl();
    await meditationThemeHiveService.registerAdapterHive();
    return meditationThemeHiveService;
  }

  @override
  Future<void> registerAdapterHive() async {
    Hive.registerAdapter(SessionDurationDTOAdapter());

    Hive.registerAdapter(MusicDtoTypesAdapter());

    Hive.registerAdapter(MusicDTOAdapter());

    Hive.registerAdapter(IntervalBellDTOAdapter());

    Hive.registerAdapter(MainMusicDTOAdapter());

    Hive.registerAdapter(AmbientSoundsDTOAdapter());

    Hive.registerAdapter(MeditationThemeDTOAdapter());
  }

  @override
  Future<void> openBoxHive() async {
    await Hive.openBox<SessionDurationDTO>('sessionMeditation');

    await Hive.openBox<MusicDTO>('musicDTO');

    await Hive.openBox<IntervalBellDTO>('intervalBellDTO');

    await Hive.openBox<MainMusicDTO>('mainMusicDTO');

    await Hive.openBox<AmbientSoundsDTO>('ambientSoundsDTO');

    await Hive.openBox<MeditationThemeDTO>('meditationThemeDTO');
  }

  @override
  void seedMeditation() {
    //Music File Of Interval Bell Sound BEGIN
    MusicDTOHive.addMusicDTO(
      name: 'Bell 1',
      assetPath: AssetsPath.intervalBell1,
      type: MusicDtoTypes.intervalBell,
      isAssetFile: true,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Bell 2',
      assetPath: AssetsPath.intervalBell2,
      type: MusicDtoTypes.intervalBell,
      isAssetFile: true,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Singing Bowl 1',
      assetPath: AssetsPath.intervalSingingBowl1,
      type: MusicDtoTypes.intervalBell,
      isAssetFile: true,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Singing Bowl 2',
      assetPath: AssetsPath.intervalSingingBowl2,
      type: MusicDtoTypes.intervalBell,
      isAssetFile: true,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Gongs 1',
      assetPath: AssetsPath.intervalGongs1,
      type: MusicDtoTypes.intervalBell,
      isAssetFile: true,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Gongs 2',
      assetPath: AssetsPath.intervalGongs2,
      type: MusicDtoTypes.intervalBell,
      isAssetFile: true,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Wood 1',
      assetPath: AssetsPath.intervalWood1,
      type: MusicDtoTypes.intervalBell,
      isAssetFile: true,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Wood 2',
      assetPath: AssetsPath.intervalWood2,
      type: MusicDtoTypes.intervalBell,
      isAssetFile: true,
    );
    //Music File Of Interval Bell Sound END

    //Music File Of Ambient Sounds BEGIN
    MusicDTOHive.addMusicDTO(
      name: 'Bowl',
      assetPath: AssetsPath.ambientSoundsBowl,
      iconPath: AssetsPath.icBowl,
      type: MusicDtoTypes.ambientSound,
      activeIconPath: AssetsPath.icActiveBowl,
      isAssetFile: true,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Night Weather',
      assetPath: AssetsPath.ambientSoundsNightWeather,
      iconPath: AssetsPath.icNightWeather,
      type: MusicDtoTypes.ambientSound,
      activeIconPath: AssetsPath.icActiveNightWeather,
      isAssetFile: true,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Wood',
      assetPath: AssetsPath.ambientSoundsWood,
      iconPath: AssetsPath.icWood,
      type: MusicDtoTypes.ambientSound,
      activeIconPath: AssetsPath.icActiveWood,
      isAssetFile: true,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Bird',
      assetPath: AssetsPath.ambientSoundsBird,
      iconPath: AssetsPath.icBird,
      type: MusicDtoTypes.ambientSound,
      activeIconPath: AssetsPath.icActiveBird,
      isAssetFile: true,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Wave',
      assetPath: AssetsPath.ambientSoundsWave,
      iconPath: AssetsPath.icWave,
      type: MusicDtoTypes.ambientSound,
      activeIconPath: AssetsPath.icActiveWave,
      isAssetFile: true,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Heart Beat',
      assetPath: AssetsPath.ambientSoundsHeartBeat,
      iconPath: AssetsPath.icHeartBeat,
      type: MusicDtoTypes.ambientSound,
      activeIconPath: AssetsPath.icActiveHeartBeat,
      isAssetFile: true,
    );
    //Music File Of Ambient Sounds END

    //Music File Of Main Music BEGIN
    MusicDTOHive.addMusicDTO(
      name: 'Om Mani Padme Hum',
      assetPath: AssetsPath.musicOmManiPadmeHum,
      type: MusicDtoTypes.mainMusic,
      isAssetFile: true,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Chinese Sounds',
      onlineUrl: AssetsPath.onlineMusicChineseSounds,
      type: MusicDtoTypes.mainMusic,
      isAssetFile: false,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Native American Indian',
      onlineUrl: AssetsPath.onlineMusicNativeAmericanIndian,
      type: MusicDtoTypes.mainMusic,
      isAssetFile: false,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Osho Chakra Sounds',
      onlineUrl: AssetsPath.onlineMusicOshoChakraSounds,
      type: MusicDtoTypes.mainMusic,
      isAssetFile: false,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Tibetan Deep',
      onlineUrl: AssetsPath.onlineMusicTibetanDeep,
      type: MusicDtoTypes.mainMusic,
      isAssetFile: false,
    );

    MusicDTOHive.addMusicDTO(
      name: 'Tibetan Singing Bowl',
      onlineUrl: AssetsPath.onlineMusicTibetanSingingBowl,
      type: MusicDtoTypes.mainMusic,
      isAssetFile: false,
    );

    //Music File Of Main Music END

    //Interval Bell Sound
    IntervalBellDTOHive.addIntervalBellDTO(
      duration: 4,
      volume: 100,
      musicDTO: Boxes.getListMusicDTO()
          .values
          .where(
            (element) => element.type == MusicDtoTypes.intervalBell,
          )
          .toList()
          .first,
    );

    IntervalBellDTOHive.addIntervalBellDTO(
      duration: 4,
      volume: 100,
      musicDTO: Boxes.getListMusicDTO()
          .values
          .where(
            (element) => element.type == MusicDtoTypes.intervalBell,
          )
          .toList()
          .last,
    );

    //Main Music
    MusicDTO omMani = Boxes.getListMusicDTO().values.firstWhere(
          (element) =>
              element.type == MusicDtoTypes.mainMusic &&
              element.name == 'Om Mani Padme Hum',
        );

    MainMusicDTOHive.addMainMusicDTO(
      volume: 100,
      musicDTO: omMani,
    );

    MusicDTO chineseSound = Boxes.getListMusicDTO().values.firstWhere(
          (element) =>
              element.type == MusicDtoTypes.mainMusic &&
              element.name == 'Chinese Sounds',
        );
    MainMusicDTOHive.addMainMusicDTO(
      volume: 100,
      musicDTO: chineseSound,
    );

    MusicDTO nativeAmerican = Boxes.getListMusicDTO().values.firstWhere(
          (element) =>
              element.type == MusicDtoTypes.mainMusic &&
              element.name == 'Native American Indian',
        );
    MainMusicDTOHive.addMainMusicDTO(
      volume: 100,
      musicDTO: nativeAmerican,
    );

    //Ambient Sounds
    List<MusicDTO> listMusicDTO = Boxes.getListMusicDTO()
        .values
        .where(
          (element) => element.type == MusicDtoTypes.ambientSound,
        )
        .toList();
    AmbientSoundsDTOHive.addAmbientSoundsDTO(
      volume: 8,
      listMusicDTO: listMusicDTO.sublist(
        listMusicDTO.length - 3,
      ),
    );

    // MeditationThemeDTOHive

    final now = DateTime.now();

    MainMusicDTO chineseSoundMainMusic = Boxes.getListMainMusicDTO()
        .values
        .firstWhere((element) => element.musicDTO.name == 'Chinese Sounds');
    MeditationThemeDTOHive.addMeditationThemeDTO(
      name: 'Natural',
      duration: 15,
      intervalBellDTO: Boxes.getListIntervalBellDTO().values.first,
      mainMusicDTO: chineseSoundMainMusic,
      ambientSoundsDTO: Boxes.getListAmbientSoundsDTO().values.first,
      isPremium: false,
      createdAt: now,
      updatedAt: now,
      isDefault: true,
    );

    MainMusicDTO omManiMainMusic = Boxes.getListMainMusicDTO()
        .values
        .firstWhere((element) => element.musicDTO.name == 'Om Mani Padme Hum');
    MeditationThemeDTOHive.addMeditationThemeDTO(
      name: 'Good Night',
      duration: 20,
      intervalBellDTO: Boxes.getListIntervalBellDTO().values.last,
      mainMusicDTO: omManiMainMusic,
      ambientSoundsDTO: Boxes.getListAmbientSoundsDTO().values.first,
      isPremium: true,
      createdAt: now,
      updatedAt: now,
      isDefault: true,
    );

    MainMusicDTO nativeAmericanMainMusic = Boxes.getListMainMusicDTO()
        .values
        .firstWhere(
            (element) => element.musicDTO.name == 'Native American Indian');
    MeditationThemeDTOHive.addMeditationThemeDTO(
      name: 'Mindful',
      duration: 25,
      intervalBellDTO: Boxes.getListIntervalBellDTO().values.last,
      mainMusicDTO: nativeAmericanMainMusic,
      ambientSoundsDTO: Boxes.getListAmbientSoundsDTO().values.first,
      isPremium: false,
      createdAt: now,
      updatedAt: now,
      isDefault: true,
    );
  }
}
