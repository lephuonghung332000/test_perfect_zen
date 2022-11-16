import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:component/atom/toast.dart';
import 'package:dependencies/dependencies.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:uuid/uuid.dart';

class DownloadMusicBloc extends Bloc<DownloadMusicEvent, DownloadMusicState> {
  final UpdateMusicUseCase updateMusicUseCase;
  String? currentDownloadTaskId;
  String? path;
  MusicDTO? music;
  final _port = ReceivePort();

  DownloadMusicBloc({
    required this.updateMusicUseCase,
  }) : super(DownloadMusicInitial()) {
    on<CancelDownloadMusicEvent>((event, emit) async {
      FlutterDownloader.cancelAll();
      emit(CancelDownloadMusicState(
          randomStringToUpdateState: const Uuid().v4()));
    });

    on<StartDownloadMusicEvent>((event, emit) async {
      emit(DownloadingMusicState(
        musicName: event.music.name,
        downloadPercent: 0,
      ));

      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      String name = event.music.onlineUrl!.split('/').last;
      path = '$appDocPath/$name';
      music = event.music;

      // Add download file to queue of Flutter Downloader.
      currentDownloadTaskId = await FlutterDownloader.enqueue(
        fileName: name,
        url: event.music.onlineUrl!,
        headers: {}, // optional: header send with url (auth token etc)
        savedDir: appDocPath,
        showNotification:
            true, // show download progress in status bar (for Android)
        openFileFromNotification:
            true, // click on notification to open downloaded file (for Android)
      );
    });

    _bindBackgroundIsolate();
    FlutterDownloader.registerCallback(downloadCallback);
  }

  void _bindBackgroundIsolate() {
    final isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) async {
      final taskId = (data as List<dynamic>)[0] as String;
      final status = data[1] as DownloadTaskStatus;
      final progress = data[2] as int;
      print('downloading: $progress%');
      if (progress > 0 && progress <= 100) {
        emit(DownloadingMusicState(
          musicName: music?.name ?? '',
          downloadPercent: progress,
        ));
      }

      if (currentDownloadTaskId == null || path == null || music == null) {
        return;
      }

      if (taskId == currentDownloadTaskId) {
        if (status == DownloadTaskStatus.complete) {
          final isExist = await File(path!).exists();
          if (isExist) {
            final result = await updateMusicUseCase(
              UpdateMusicParams(
                data: UpdateMusicBody(
                  musicPath: path!,
                  originalMusicDTO: music!,
                ),
              ),
            );
            result.fold(
              (failure) {
                emit(FailedDownloadMusicState(musicName: music?.name ?? ''));
                Toast.show(message: S.current.edit_meditation_theme_failed);
              },
              (listMusicDTO) {
                _openAndStopMusic(listMusic: listMusicDTO);
                emit(SuccessDownloadMusicState(musicName: music?.name ?? ''));

                Future.delayed(const Duration(milliseconds: 500), () {
                  emit(DoneDownloadMusicState(musicName: music?.name ?? ''));
                });

                Future.delayed(const Duration(milliseconds: 500), () {
                  emit(RefreshDownloadMusicState(musicName: music?.name ?? ''));
                });
              },
            );
          } else {
            emit(FailedDownloadMusicState(musicName: music?.name ?? ''));
          }
        } else if (status == DownloadTaskStatus.failed) {
          emit(FailedDownloadMusicState(musicName: music?.name ?? ''));
        }
      }
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  @override
  Future<void> close() {
    // dispose
    GetIt.I<DownloadMusicBloc>().close();
    _unbindBackgroundIsolate();
    return super.close();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
    String id,
    DownloadTaskStatus status,
    int progress,
  ) {
    IsolateNameServer.lookupPortByName('downloader_send_port')
        ?.send([id, status, progress]);
  }

  void _openAndStopMusic({required List<MusicDTO> listMusic}) {
    final listMainMusic = listMusic
        .where((music) => music.type == MusicDtoTypes.mainMusic)
        .toList();
    for (final music in listMainMusic) {
      final musicPlayer = AssetsAudioPlayer.withId(music.musicPlayerId);

      if (music.filePath != null) {
        musicPlayer.open(
          Playlist(
            audios: [
              music.filePath!.contains('asset')
                  ? Audio(music.filePath!)
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

extension StringExt on String {
  Audio get audioFile {
    if (Platform.isAndroid) {
      final path = Uri.encodeComponent(this);
      return Audio.file(path);
    }

    final path = File(this).path;
    return Audio.file(path);
  }
}
