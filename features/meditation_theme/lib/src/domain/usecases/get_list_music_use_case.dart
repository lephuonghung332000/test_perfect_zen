import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../meditation_theme.dart';

class GetListMusicUseCase implements UseCase<List<MusicDTO>, MusicDtoTypes?> {
  final MeditationThemeRepository repository;

  GetListMusicUseCase({required this.repository});

  @override
  Future<Either<Failure, List<MusicDTO>>> call(MusicDtoTypes? type) async {
    return await repository.getListMusicDTO(type: type);
  }
}
