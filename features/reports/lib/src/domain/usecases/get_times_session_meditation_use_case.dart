import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

class GetTimesSessionMeditationUseCase
    implements UseCase<int, List<SessionDurationDTO>> {
  final MeditationThemeRepository repository;

  GetTimesSessionMeditationUseCase({required this.repository});

  @override
  Future<Either<Failure, int>> call(
      List<SessionDurationDTO> meditations) async {
    return await repository.getTimeSession();
  }
}
