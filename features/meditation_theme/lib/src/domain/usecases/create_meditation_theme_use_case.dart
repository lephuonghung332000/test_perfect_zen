import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../meditation_theme.dart';

class CreateMeditationThemeUseCase
    implements UseCase<List<MeditationThemeDTO>, MeditationThemeDTO> {
  final MeditationThemeRepository repository;

  CreateMeditationThemeUseCase({required this.repository});

  @override
  Future<Either<Failure, List<MeditationThemeDTO>>> call(
      MeditationThemeDTO meditationThemeDTO) async {
    return await repository.createMeditationThemeDTO(
      name: meditationThemeDTO.name,
      duration: meditationThemeDTO.duration,
      intervalBellDTO: meditationThemeDTO.intervalBellDTO,
      mainMusicDTO: meditationThemeDTO.mainMusicDTO,
      ambientSoundsDTO: meditationThemeDTO.ambientSoundsDTO,
      createdAt: meditationThemeDTO.createdAt,
    );
  }
}
