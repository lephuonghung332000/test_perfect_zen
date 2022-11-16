import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/domain/domain.dart';
import 'package:settings/src/presentation/blocs/blocs.dart';
import 'package:bloc/bloc.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  late final SendFeedBackUseCase sendFeedBackUseCase;
  String email = '';
  final messageController = TextEditingController();

  FeedbackBloc({required this.sendFeedBackUseCase}) : super(InitialState()) {
    on<SendFeedbackEvent>((event, emit) async {
      final result = await sendFeedBackUseCase.call(FeedbackData(
        message: messageController.text,
        email: email,
      ));
      result.fold(
        (failure) {
          emit(SendFeedbackFailed());
        },
        (sendFeedbackDTO) {
          emit(SendFeedbackSuccess());
        },
      );
    });
    on<InputEmailFeedbackEvent>((event, emit) {
      email = event.email;
      final isShowSubmit = event.email.length > 2;

      if (isShowSubmit) {
        emit(EnableSubmitFeedback());
      } else {
        emit(DisableSubmitFeedback());
      }
    });
  }
}
