import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

abstract class DownloadMusicEvent extends Equatable {
  const DownloadMusicEvent();
}

class StartDownloadMusicEvent extends DownloadMusicEvent {
  final MusicDTO music;

  const StartDownloadMusicEvent({
    required this.music,
  });

  @override
  List<Object?> get props => [music];
}

class CancelDownloadMusicEvent extends DownloadMusicEvent {
  const CancelDownloadMusicEvent();

  @override
  List<Object?> get props => [];
}
