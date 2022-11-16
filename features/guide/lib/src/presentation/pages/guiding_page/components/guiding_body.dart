import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import '../../../blocs/blocs.dart';
import '../../../component/component.dart';
import 'guiding_button_bar.dart';
import 'guiding_progress_bar.dart';

AudioPlayer? audioPlayer;

class GuidingBody extends StatefulWidget {
  final String title;
  final String url;

  const GuidingBody({
    Key? key,
    required this.title,
    required this.url,
  }) : super(
          key: key,
        );

  @override
  State<GuidingBody> createState() => _GuidingBodyState();
}

class _GuidingBodyState extends State<GuidingBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: MediaQuery.of(context).padding.top,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: MusicPlayerTitleBar(title: widget.title),
          ),
        ),
        Positioned(
          bottom: 80,
          left: 0,
          right: 0,
          child: BlocProvider(
            create: (context) => MusicPlayerBloc(url: widget.url),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const GuidingProgressBar(),
                const SizedBox(
                  height: 32,
                ),
                GuidingButtonBar(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
