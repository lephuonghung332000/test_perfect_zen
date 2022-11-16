import 'package:dependencies/dependencies.dart';

abstract class FirstTimeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FirstTimeInitial extends FirstTimeState {}

class ShowingTutorialState extends FirstTimeState {
  @override
  List<Object?> get props => [];
}
