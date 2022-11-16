import 'package:dependencies/dependencies.dart';

abstract class FirstTimeEvent extends Equatable {}

class OpenAppEvent extends FirstTimeEvent {
  OpenAppEvent();

  @override
  List<Object?> get props => [];
}

class DoneFirstTimeEvent extends FirstTimeEvent {
  @override
  List<Object?> get props => [];
}
