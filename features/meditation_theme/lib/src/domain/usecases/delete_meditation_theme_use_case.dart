import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../meditation_theme.dart';

class DeleteMeditationThemeUseCase
    implements UseCase<List<MeditationThemeDTO>, MeditationThemeDTO> {
  final MeditationThemeRepository repository;

  DeleteMeditationThemeUseCase({required this.repository});

  @override
  Future<Either<Failure, List<MeditationThemeDTO>>> call(
      MeditationThemeDTO theme) async {
    return await repository.deleteMeditationThemeDTO(theme: theme);
  }
}
