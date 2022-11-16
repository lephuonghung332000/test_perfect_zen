import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../meditation_theme.dart';

class UpdateMusicUseCase implements UseCase<List<MusicDTO>, UpdateMusicParams> {
  final MeditationThemeRepository repository;

  UpdateMusicUseCase({required this.repository});

  @override
  Future<Either<Failure, List<MusicDTO>>> call(UpdateMusicParams params) async {
    return await repository.updateMusicDTO(params: params);
  }
}

class UpdateMusicParams {
  final UpdateMusicBody data;
  UpdateMusicParams({
    required this.data,
  });
}
