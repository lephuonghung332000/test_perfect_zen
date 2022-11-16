import 'package:dependencies/dependencies.dart';

abstract class DownloadMusicState extends Equatable {
  const DownloadMusicState();
}

class DownloadMusicInitial extends DownloadMusicState {
  @override
  List<Object> get props => [];
}

class DownloadingMusicState extends DownloadMusicState {
  final int downloadPercent;
  final String musicName;
  const DownloadingMusicState({
    required this.musicName,
    required this.downloadPercent,
  });

  @override
  List<Object?> get props => [downloadPercent];
}

class SuccessDownloadMusicState extends DownloadMusicState {
  final String musicName;
  const SuccessDownloadMusicState({required this.musicName});

  @override
  List<Object?> get props => [];
}

class FailedDownloadMusicState extends DownloadMusicState {
  final String musicName;
  const FailedDownloadMusicState({required this.musicName});

  @override
  List<Object?> get props => [];
}

class DoneDownloadMusicState extends DownloadMusicState {
  final String musicName;
  const DoneDownloadMusicState({required this.musicName});

  @override
  List<Object?> get props => [];
}

class CancelDownloadMusicState extends DownloadMusicState {
  final String randomStringToUpdateState;
  const CancelDownloadMusicState({required this.randomStringToUpdateState});

  @override
  List<Object?> get props => [randomStringToUpdateState];
}

class RefreshDownloadMusicState extends DownloadMusicState {
  final String musicName;
  const RefreshDownloadMusicState({required this.musicName});

  @override
  List<Object?> get props => [];
}
