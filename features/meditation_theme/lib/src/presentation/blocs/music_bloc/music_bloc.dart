import 'dart:io';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:component/atom/toast.dart';
import 'package:dependencies/dependencies.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final GetListMusicUseCase getListMusicUseCase;
  final UpdateMusicUseCase updateMusicUseCase;
  final SaveAudioUseCase saveAudioUseCase;
  final logger = GetIt.I<Logger>();

  MusicBloc({
    required this.getListMusicUseCase,
    required this.updateMusicUseCase,
    required this.saveAudioUseCase,
  }) : super(MusicInitial()) {
    on<LoadMusicEvent>((event, emit) async {
      final result = await getListMusicUseCase(null);
      result.fold(
        (failure) {
          Toast.show(message: S.current.get_list_music_failed);
        },
        (listMusicDTO) {
          _openAndStopMusic(listMusic: listMusicDTO);
          emit(MusicLoadedState(listMusicDTO));
        },
      );
    });

    on<AddAudioEvent>(
      (event, emit) async {
        final fileResult =
            await FilePicker.platform.pickFiles(type: FileType.any);

        if (fileResult?.files.isNotEmpty ?? false) {
          final file = File(fileResult!.files.first.path!);

          // Save file to audios dir.
          Directory appDocumentsDirectory =
              await getApplicationDocumentsDirectory();
          String appDocumentsPath = '${appDocumentsDirectory.path}/audios';
          final dir = Directory(appDocumentsPath);

          try {
            dir.createSync();
          } catch (e) {
            logger.e(e);
          }

          String fileName = file.path.split('/').last;
          final fileTemp = File('$appDocumentsPath/$fileName');
          final bytes = await file.readAsBytes();
          fileTemp.writeAsBytes(bytes);

          // After saved file in audio dir success, save to db.
          final result = await saveAudioUseCase(file);

          result.fold(
            (l) => null,
            (r) {
              add(const LoadMusicEvent());
            },
          );
        }
      },
    );
  }

  @override
  Future<void> close() {
    // dispose
    GetIt.I<MusicBloc>().close();
    return super.close();
  }

  void _openAndStopMusic({required List<MusicDTO> listMusic}) {
    for (final music in listMusic) {
      final musicPlayer = AssetsAudioPlayer.withId(music.musicPlayerId);

      if (music.filePath != null || music.assetPath != null) {
        musicPlayer.open(
          Playlist(
            audios: [
              music.assetPath != null
                  ? Audio(music.assetPath!)
                  : music.filePath!.audioFile,
            ],
          ),
          loopMode: LoopMode.none,
          autoStart: false,
          volume: 1,
          showNotification: true,
          respectSilentMode: true,
        );
        musicPlayer.stop();
      }
    }
  }
}
