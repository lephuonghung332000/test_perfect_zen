import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

class GetListSessionMeditationThemeUseCase implements UseCase<List<SessionDurationDTO>, NoParams> {
  final MeditationThemeRepository repository;

  GetListSessionMeditationThemeUseCase({required this.repository});

  @override
  Future<Either<Failure, List<SessionDurationDTO>>> call(NoParams params) async {
    return await repository.getListSessionMeditation(params);
  }
}
