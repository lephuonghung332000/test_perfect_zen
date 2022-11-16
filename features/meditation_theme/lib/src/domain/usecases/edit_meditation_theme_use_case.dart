import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../meditation_theme.dart';

class EditMeditationThemeUseCase
    implements UseCase<List<MeditationThemeDTO>, EditMeditationThemeParams> {
  final MeditationThemeRepository repository;

  EditMeditationThemeUseCase({required this.repository});

  @override
  Future<Either<Failure, List<MeditationThemeDTO>>> call(
      EditMeditationThemeParams params) async {
    return await repository.editMeditationThemeDTO(params: params);
  }
}

class EditMeditationThemeParams {
  final EditMeditationThemeBody data;
  EditMeditationThemeParams({
    required this.data,
  });
}
