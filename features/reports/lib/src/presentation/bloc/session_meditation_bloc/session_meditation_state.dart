import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

abstract class SessionMeditationState extends Equatable {
  const SessionMeditationState();
}

class SessionMeditationInitial extends SessionMeditationState {
  @override
  List<Object> get props => [];
}

class SessionMeditationLoadedState extends SessionMeditationState {
  final List<SessionDurationDTO> listSessionMeditationDTO;

  const SessionMeditationLoadedState(
    this.listSessionMeditationDTO,
  );

  @override
  List<Object?> get props => listSessionMeditationDTO;
}

class AddSessionMeditationLoadedState extends SessionMeditationState {
  final List<SessionDurationDTO> listSessionMeditation;

  const AddSessionMeditationLoadedState(
    this.listSessionMeditation,
  );

  @override
  List<Object> get props => [listSessionMeditation.length];
}

class GetTimesSessionMeditationState extends SessionMeditationState {
  final int consecutiveness;
  const GetTimesSessionMeditationState(this.consecutiveness);

  @override
  List<Object?> get props => [consecutiveness];
}
