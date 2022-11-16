import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../domain/usecases/usecases.dart';
import 'first_time_event.dart';
import 'first_time_state.dart';

class FirstTimeBloc extends Bloc<FirstTimeEvent, FirstTimeState> {
  final GetFirstStatusUseCase getFirstStatusUseCase;
  final SetDoneFirstUseCase setDoneFirstUseCase;
  OverlayEntry? tutorial;

  FirstTimeBloc({
    required this.getFirstStatusUseCase,
    required this.setDoneFirstUseCase,
  }) : super(FirstTimeInitial()) {
    on<OpenAppEvent>((event, emit) async {
      final result = await getFirstStatusUseCase(NoParams());

      result.fold((failure) {
        // todo: process get local storage failed.
      }, (isFirst) {
        if (!isFirst) {
          return;
        }

        emit(ShowingTutorialState());
      });
    });

    on<DoneFirstTimeEvent>((event, emit) {
      setDoneFirstUseCase(NoParams());
    });
  }
}
