import 'package:component/component.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

import '../../../../meditation_theme.dart';

class DownloadThemeDialog extends StatelessWidget {
  final Function onSuccess;
  const DownloadThemeDialog({
    required this.onSuccess,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloadMusicBloc, DownloadMusicState>(
        builder: (context, state) {
      int downloadPercent = 0;
      if (state is DownloadingMusicState) {
        downloadPercent = state.downloadPercent;
      }

      if (state is SuccessDownloadMusicState) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            onSuccess.call();
          },
        );
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            S.current.downloading_music,
            style: CustomTextStyle.TITLE_14.apply(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              const Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: StaticColors.inside_ellipse,
                  ),
                ),
              ),
              Text(
                '$downloadPercent%',
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonDialog(
                  text: S.current.discard,
                  style: ActionButtonStyle.empty,
                  onPressed: () {
                    context
                        .read<DownloadMusicBloc>()
                        .add(const CancelDownloadMusicEvent());
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      );
    });
  }
}
