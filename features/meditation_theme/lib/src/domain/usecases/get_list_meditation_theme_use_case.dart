import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../meditation_theme.dart';

class GetListMeditationThemeUseCase implements UseCase<List<MeditationThemeDTO>, NoParams> {
  final MeditationThemeRepository repository;

  GetListMeditationThemeUseCase({required this.repository});

  @override
  Future<Either<Failure, List<MeditationThemeDTO>>> call(NoParams params) async {
    return await repository.getListMeditationThemeDTO(params);
  }
}
