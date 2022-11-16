import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../../guide.dart';
import '../../../blocs/bloc/music_player/music_player_state.dart';
import '../../../blocs/blocs.dart';

class GuidingProgressBar extends StatelessWidget {
  const GuidingProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16.0),
      child: BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
        buildWhen: (previous, current) {
          return current is UpdateProgressState || current is InitialState;
        },
        builder: (context, state) {
          Duration _duration = const Duration();
          Duration _position = const Duration();

          if (state is InitialState) {
            _duration = Duration.zero;
            _position = Duration.zero;
          } else if (state is UpdateProgressState) {
            _duration = state.duration;
            _position = state.position;
          }

          return MusicPlayerProgressBar(
            duration: _duration,
            position: _position,
          );
        },
      ),
    );
  }
}
