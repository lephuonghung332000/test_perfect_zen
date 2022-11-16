import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

class AddSessionMeditationUseCase implements UseCase<List<SessionDurationDTO>, int> {
  final MeditationThemeRepository repository;

  AddSessionMeditationUseCase({required this.repository});

  @override
  Future<Either<Failure, List<SessionDurationDTO>>> call(int duration) async {
    return await repository.addSessionMeditation(duration);
  }
}
