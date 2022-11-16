import 'package:dependencies/dependencies.dart';
import 'package:meditation_theme/meditation_theme.dart';

abstract class SessionMeditationEvent extends Equatable {
  const SessionMeditationEvent();
}

class LoadSessionMeditationEvent extends SessionMeditationEvent {
  const LoadSessionMeditationEvent();

  @override
  List<Object?> get props => [];
}

class AddSessionMeditationEvent extends SessionMeditationEvent {
  final int duration;
  final Function onSuccess;
  const AddSessionMeditationEvent({
    required this.duration,
    required this.onSuccess,
  });

  @override
  List<Object?> get props => [
        duration,
        onSuccess,
      ];
}

class GetTimesSessionMeditationEvent extends SessionMeditationEvent {
  final List<SessionDurationDTO> listSessionMeditation;
  const GetTimesSessionMeditationEvent(this.listSessionMeditation);

  @override
  List<Object?> get props => listSessionMeditation;
}
