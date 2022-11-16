import 'dart:io';

import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

class SaveAudioUseCase implements UseCase<void, File> {
  final MeditationThemeRepository repository;
  SaveAudioUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(File params) async {
    String fileName = params.path.split('/').last;
    return await repository.addMusicDTO(
        name: fileName.split('.').first,
        filePath: params.path,
        type: MusicDtoTypes.mainMusic);
  }
}
