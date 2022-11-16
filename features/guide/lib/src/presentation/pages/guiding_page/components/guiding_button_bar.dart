import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../../guide.dart';
import '../../../blocs/bloc/music_player/music_player_event.dart';
import '../../../blocs/bloc/music_player/music_player_state.dart';
import '../../../blocs/blocs.dart';

class GuidingButtonBar extends StatelessWidget {
  const GuidingButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
        buildWhen: (previous, current) {
          return current is PlayingState || current is PausingState;
        },
        builder: (context, state) {
          final isPlaying = state is PlayingState;
          return MusicPlayerButtonBar(
            onPause: () {
              context.read<MusicPlayerBloc>().add(
                    PauseEvent(),
                  );
            },
            onPlay: () {
              context.read<MusicPlayerBloc>().add(
                    PlayEvent(),
                  );
            },
            onRefresh: () {
              context.read<MusicPlayerBloc>().add(
                    RefreshEvent(),
                  );
            },
            isPlaying: isPlaying,
          );
        },
      ),
    );
  }
}
