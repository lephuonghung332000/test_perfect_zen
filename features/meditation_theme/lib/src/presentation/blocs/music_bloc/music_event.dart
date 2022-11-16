import 'dart:io';

import 'package:dependencies/dependencies.dart';

abstract class MusicEvent extends Equatable {
  const MusicEvent();
}

class LoadMusicEvent extends MusicEvent {
  const LoadMusicEvent();

  @override
  List<Object?> get props => [];
}

class AddAudioEvent extends MusicEvent {
  @override
  List<Object?> get props => [];
}

class SaveAudioEvent extends MusicEvent {
  final File file;
  const SaveAudioEvent({required this.file});
  @override
  List<Object?> get props => [file];
}
