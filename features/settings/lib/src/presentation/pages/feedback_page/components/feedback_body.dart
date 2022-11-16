import 'package:component/atom/atom.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';

import '../../../../../settings.dart';

class FeedBackBody extends StatelessWidget {
  const FeedBackBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<FeedbackBloc, FeedbackState>(
      listener: (context, state) {
        if (state is SendFeedbackSuccess) {
          GetIt.I<AnalyticsHelper>().logEvent(
              CommontAnalyticsEvent(EventName.sendFeedbackSuccessful));
          Toast.show(message: S.current.feedback_toast);
          Navigator.pop(context);
          return;
        }

        if (state is SendFeedbackFailed) {
          Toast.show(message: S.current.toast_error);
          return;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Text(
              S.current.message_feedback,
              style: CustomTextStyle.BODY_14,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              S.current.feedback,
              style: CustomTextStyle.TITLE_14,
            ),
            const SizedBox(
              height: 5,
            ),
            MessageFeedBack(
              controller: context.read<FeedbackBloc>().messageController,
              onTextChange: (value) {},
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              S.current.email,
              style: CustomTextStyle.TITLE_14,
            ),
            const SizedBox(
              height: 5,
            ),
            EmailFeedback(
              onTextChanges: (value) {
                context
                    .read<FeedbackBloc>()
                    .add(InputEmailFeedbackEvent(email: value));
              },
            ),
            const SizedBox(
              height: 80,
            ),
            BlocBuilder<FeedbackBloc, FeedbackState>(
              buildWhen: ((previous, current) {
                return current is SubmitFeedback;
              }),
              builder: (context, state) {
                if (state is EnableSubmitFeedback) {
                  return SubmitBody(onPressed: () async {
                    context.read<FeedbackBloc>().add(const SendFeedbackEvent());
                  });
                } else {
                  return const SubmitFaceBody();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
