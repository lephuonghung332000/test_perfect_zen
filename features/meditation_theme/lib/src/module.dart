import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:review_app/review_app.dart';

class MeditationThemeModule implements BaseModule {
  @override
  void inject(GetIt getIt) {
    // Presentation

    getIt.registerLazySingleton(() => MeditationThemeHiveServiceImpl());
    getIt<MeditationThemeHiveServiceImpl>().registerAdapterHive();

    getIt.registerLazySingleton(
      () => DeleteMeditationThemeBloc(
        deleteMeditationThemeUseCase: DeleteMeditationThemeUseCase(
          repository: MeditationThemeImpl(
            meditationThemeLocalDataSource: MeditationThemeLocalDataSourceImpl(
              meditationThemeHiveService:
                  GetIt.I<MeditationThemeHiveServiceImpl>(),
            ),
          ),
        ),
      ),
    );

    getIt.registerLazySingleton(
      () => MusicBloc(
        getListMusicUseCase: GetListMusicUseCase(
          repository: MeditationThemeImpl(
            meditationThemeLocalDataSource: MeditationThemeLocalDataSourceImpl(
              meditationThemeHiveService:
                  GetIt.I<MeditationThemeHiveServiceImpl>(),
            ),
          ),
        ),
        updateMusicUseCase: UpdateMusicUseCase(
          repository: MeditationThemeImpl(
            meditationThemeLocalDataSource: MeditationThemeLocalDataSourceImpl(
              meditationThemeHiveService:
                  GetIt.I<MeditationThemeHiveServiceImpl>(),
            ),
          ),
        ),
        saveAudioUseCase: SaveAudioUseCase(
          repository: MeditationThemeImpl(
            meditationThemeLocalDataSource: MeditationThemeLocalDataSourceImpl(
              meditationThemeHiveService:
                  GetIt.I<MeditationThemeHiveServiceImpl>(),
            ),
          ),
        ),
      ),
    );

    getIt.registerLazySingleton(
      () => MeditationThemeBloc(
        getListMeditationThemeUseCase: GetListMeditationThemeUseCase(
          repository: MeditationThemeImpl(
            meditationThemeLocalDataSource: MeditationThemeLocalDataSourceImpl(
              meditationThemeHiveService:
                  GetIt.I<MeditationThemeHiveServiceImpl>(),
            ),
          ),
        ),
      ),
    );

    getIt.registerLazySingleton(
      () => CreateMeditationThemeBloc(
        createMeditationThemeUseCase: CreateMeditationThemeUseCase(
          repository: MeditationThemeImpl(
            meditationThemeLocalDataSource: MeditationThemeLocalDataSourceImpl(
              meditationThemeHiveService:
                  GetIt.I<MeditationThemeHiveServiceImpl>(),
            ),
          ),
        ),
      ),
    );

    getIt.registerLazySingleton(
      () => EditMeditationThemeBloc(
        editMeditationThemeUseCase: EditMeditationThemeUseCase(
          repository: MeditationThemeImpl(
            meditationThemeLocalDataSource: MeditationThemeLocalDataSourceImpl(
              meditationThemeHiveService:
                  GetIt.I<MeditationThemeHiveServiceImpl>(),
            ),
          ),
        ),
      ),
    );

    getIt.registerFactory(() => ReviewBloc(
        checkReviewCountUseCase: CheckReviewCountUseCase(
            repository: SettingRepositoryImpl(
          localDataSource: ReviewLocalDataSourceImpl(
            localStorageManager: GetIt.I<LocalStorageManager>(),
          ),
        )),
        saveReviewCountUseCase: SaveReviewCountUseCase(
            repository: SettingRepositoryImpl(
          localDataSource: ReviewLocalDataSourceImpl(
            localStorageManager: GetIt.I<LocalStorageManager>(),
          ),
        ))));

    getIt.registerLazySingleton(
      () => DownloadMusicBloc(
        updateMusicUseCase: UpdateMusicUseCase(
          repository: MeditationThemeImpl(
            meditationThemeLocalDataSource: MeditationThemeLocalDataSourceImpl(
              meditationThemeHiveService:
                  GetIt.I<MeditationThemeHiveServiceImpl>(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Map<String, Route> routes(RouteSettings settings) {
    return {};
  }
}
